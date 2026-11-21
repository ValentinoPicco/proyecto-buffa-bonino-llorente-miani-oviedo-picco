package ar.edu.unrc.gestioncursos.simulador.model;

import java.time.OffsetDateTime;
import java.util.List;
import java.util.Map;

/**
 * Datos de una instancia activa de Process_Curso que el simulador muestra en
 * pantalla.
 *
 * El objeto es inmutable y se arma a partir de las respuestas de la API REST:
 * variables de la instancia, ejecuciones activas (activityId), suscripciones a
 * mensajes (eventName -> executionId) y el catalogo de nombres de actividades
 * del BPMN deployado.
 */
public final class SolicitudActiva {

    private final String id;
    private final String businessKey;
    private final String processDefinitionId;
    private final String processDefinitionName;
    private final OffsetDateTime inicio;
    private final Map<String, String> variables;
    private final List<String> actividadesActivas;
    private final Map<String, String> ejecucionesPorActividad;
    private final Map<String, String> suscripcionesPorEvento;
    private final Map<String, String> catalogoActividades;

    public SolicitudActiva(
            String id,
            String businessKey,
            String processDefinitionId,
            String processDefinitionName,
            OffsetDateTime inicio,
            Map<String, String> variables,
            List<String> actividadesActivas,
            Map<String, String> ejecucionesPorActividad,
            Map<String, String> suscripcionesPorEvento,
            Map<String, String> catalogoActividades) {
        this.id = id;
        this.businessKey = businessKey;
        this.processDefinitionId = processDefinitionId;
        this.processDefinitionName = processDefinitionName;
        this.inicio = inicio;
        this.variables = Map.copyOf(variables);
        this.actividadesActivas = List.copyOf(actividadesActivas);
        this.ejecucionesPorActividad = Map.copyOf(ejecucionesPorActividad);
        this.suscripcionesPorEvento = Map.copyOf(suscripcionesPorEvento);
        this.catalogoActividades = Map.copyOf(catalogoActividades);
    }

    public String id() {
        return id;
    }

    public String businessKey() {
        return businessKey;
    }

    public String processDefinitionId() {
        return processDefinitionId;
    }

    public String processDefinitionName() {
        return processDefinitionName;
    }

    public OffsetDateTime inicio() {
        return inicio;
    }

    public Map<String, String> variables() {
        return variables;
    }

    public List<String> actividadesActivas() {
        return actividadesActivas;
    }

    public Map<String, String> suscripcionesPorEvento() {
        return suscripcionesPorEvento;
    }

    public String texto(String clave) {
        return variables.getOrDefault(clave, "");
    }

    public boolean tieneActividad(String activityId) {
        return ejecucionesPorActividad.containsKey(activityId);
    }

    public String ejecucionDeActividad(String activityId) {
        return ejecucionesPorActividad.get(activityId);
    }

    public boolean tieneSuscripcion(String eventName) {
        return suscripcionesPorEvento.containsKey(eventName);
    }

    public String ejecucionDeSuscripcion(String eventName) {
        return suscripcionesPorEvento.get(eventName);
    }

    public String nombreActividad(String activityId) {
        return catalogoActividades.getOrDefault(activityId, activityId);
    }

    /**
     * Nombres legibles de las actividades activas. Se omiten los elementos sin
     * nombre (compuertas, eventos internos) para que el detalle sea entendible.
     */
    public List<String> nombresActividadesActivas() {
        List<String> nombres = actividadesActivas.stream()
                .filter(catalogoActividades::containsKey)
                .map(catalogoActividades::get)
                .filter(nombre -> !nombre.isBlank())
                .distinct()
                .toList();
        return nombres.isEmpty() ? List.copyOf(actividadesActivas) : nombres;
    }
}
