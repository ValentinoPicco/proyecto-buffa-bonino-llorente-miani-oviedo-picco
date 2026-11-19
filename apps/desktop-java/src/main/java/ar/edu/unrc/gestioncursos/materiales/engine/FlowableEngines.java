package ar.edu.unrc.gestioncursos.materiales.engine;

import ar.edu.unrc.gestioncursos.materiales.config.AppConfig;
import org.flowable.engine.ProcessEngine;
import org.flowable.engine.ProcessEngineConfiguration;
import org.flowable.engine.TaskService;
import org.flowable.idm.api.IdmIdentityService;
import org.flowable.idm.engine.IdmEngine;
import org.flowable.idm.engine.IdmEngineConfiguration;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Agrupa los dos motores que usa la aplicacion:
 * - ProcessEngine: tareas y ejecucion del proceso.
 * - IdmEngine: validacion de credenciales y pertenencia a grupos.
 *
 * Ambos se conectan por JDBC a la misma base que usa Flowable UI.
 * No se actualiza el esquema y no se activa el ejecutor asincronico para no
 * competir con el motor de Flowable UI que ya esta corriendo.
 */
public final class FlowableEngines implements AutoCloseable {

    private static final Logger LOG = LoggerFactory.getLogger(FlowableEngines.class);

    static {
        // Liquibase (que Flowable usa al validar el esquema) escribe INFO por
        // java.util.logging y ensucia la consola. Solo dejamos sus advertencias.
        java.util.logging.Logger.getLogger("liquibase").setLevel(java.util.logging.Level.WARNING);
    }

    private final ProcessEngine processEngine;
    private final IdmEngine idmEngine;

    private FlowableEngines(ProcessEngine processEngine, IdmEngine idmEngine) {
        this.processEngine = processEngine;
        this.idmEngine = idmEngine;
    }

    public static FlowableEngines create(AppConfig config) {
        String jdbcUrl = config.getRequerido("db.url");
        String jdbcUsuario = config.getRequerido("db.username");
        String jdbcPassword = config.getRequerido("db.password");
        String jdbcDriver = config.get("db.driver", "org.postgresql.Driver");

        LOG.info("Conectando al motor Flowable en {}", jdbcUrl);

        ProcessEngineConfiguration processConfig =
                ProcessEngineConfiguration.createStandaloneProcessEngineConfiguration();
        processConfig.setJdbcDriver(jdbcDriver);
        processConfig.setJdbcUrl(jdbcUrl);
        processConfig.setJdbcUsername(jdbcUsuario);
        processConfig.setJdbcPassword(jdbcPassword);
        processConfig.setDatabaseSchemaUpdate(ProcessEngineConfiguration.DB_SCHEMA_UPDATE_FALSE);
        processConfig.setAsyncExecutorActivate(false);

        ProcessEngine processEngine = processConfig.buildProcessEngine();

        IdmEngineConfiguration idmConfig = IdmEngineConfiguration.createStandaloneIdmEngineConfiguration();
        idmConfig.setJdbcDriver(jdbcDriver);
        idmConfig.setJdbcUrl(jdbcUrl);
        idmConfig.setJdbcUsername(jdbcUsuario);
        idmConfig.setJdbcPassword(jdbcPassword);
        idmConfig.setDatabaseSchemaUpdate(ProcessEngineConfiguration.DB_SCHEMA_UPDATE_FALSE);

        IdmEngine idmEngine = idmConfig.buildIdmEngine();

        LOG.info("Motores Flowable inicializados correctamente.");
        return new FlowableEngines(processEngine, idmEngine);
    }

    public ProcessEngine processEngine() {
        return processEngine;
    }

    public TaskService taskService() {
        return processEngine.getTaskService();
    }

    public IdmIdentityService idmIdentityService() {
        return idmEngine.getIdmIdentityService();
    }

    @Override
    public void close() {
        try {
            if (idmEngine != null) {
                idmEngine.close();
            }
        } catch (RuntimeException e) {
            LOG.warn("Error al cerrar el motor IDM", e);
        }
        try {
            if (processEngine != null) {
                processEngine.close();
            }
        } catch (RuntimeException e) {
            LOG.warn("Error al cerrar el motor de procesos", e);
        }
    }
}
