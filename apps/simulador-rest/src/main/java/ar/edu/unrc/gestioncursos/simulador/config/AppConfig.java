package ar.edu.unrc.gestioncursos.simulador.config;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.io.UncheckedIOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Locale;
import java.util.Properties;

/**
 * Carga la configuracion del simulador.
 *
 * Orden de precedencia:
 * 1. Variables de entorno con el prefijo BPMN_ (ej. BPMN_REST_BASEURL).
 * 2. Propiedades del sistema (-Drest.baseUrl=...).
 * 3. Archivo indicado con -Dconfig.file=/ruta/config.properties.
 * 4. Archivo config.properties en el directorio de ejecucion.
 * 5. config.properties incluido en el classpath.
 */
public final class AppConfig {

    private final Properties properties;
    private final String origen;

    private AppConfig(Properties properties, String origen) {
        this.properties = properties;
        this.origen = origen;
    }

    public static AppConfig load() {
        String archivoIndicado = System.getProperty("config.file");
        Path ruta = archivoIndicado != null && !archivoIndicado.isBlank()
                ? Path.of(archivoIndicado)
                : Path.of("config.properties");

        Properties properties = new Properties();
        String origen;

        if (Files.isRegularFile(ruta)) {
            try (Reader reader = new InputStreamReader(Files.newInputStream(ruta), StandardCharsets.UTF_8)) {
                properties.load(reader);
            } catch (IOException e) {
                throw new UncheckedIOException("No se pudo leer el archivo de configuracion: " + ruta, e);
            }
            origen = ruta.toAbsolutePath().normalize().toString();
        } else {
            try (InputStream in = AppConfig.class.getResourceAsStream("/config.properties")) {
                if (in == null) {
                    throw new IllegalStateException(
                            "No se encontro config.properties ni en el directorio actual ni en el classpath.");
                }
                try (Reader reader = new InputStreamReader(in, StandardCharsets.UTF_8)) {
                    properties.load(reader);
                }
            } catch (IOException e) {
                throw new UncheckedIOException("No se pudo leer config.properties del classpath.", e);
            }
            origen = "classpath:/config.properties";
        }

        return new AppConfig(properties, origen);
    }

    public String get(String clave, String valorPorDefecto) {
        String desdeEntorno = System.getenv(nombreVariableEntorno(clave));
        if (desdeEntorno != null && !desdeEntorno.isBlank()) {
            return desdeEntorno.trim();
        }

        String desdeSistema = System.getProperty(clave);
        if (desdeSistema != null && !desdeSistema.isBlank()) {
            return desdeSistema.trim();
        }

        return properties.getProperty(clave, valorPorDefecto);
    }

    public String getRequerido(String clave) {
        String valor = get(clave, null);
        if (valor == null || valor.isBlank()) {
            throw new IllegalStateException(
                    "Falta la propiedad obligatoria '" + clave + "' en la configuracion (" + origen + ").");
        }
        return valor;
    }

    public int getEntero(String clave, int valorPorDefecto) {
        String valor = get(clave, null);
        if (valor == null || valor.isBlank()) {
            return valorPorDefecto;
        }
        try {
            return Integer.parseInt(valor.trim());
        } catch (NumberFormatException e) {
            throw new IllegalStateException("La propiedad '" + clave + "' debe ser un numero entero: " + valor, e);
        }
    }

    public String getOrigen() {
        return origen;
    }

    private static String nombreVariableEntorno(String clave) {
        return "BPMN_" + clave.replace('.', '_').replace('-', '_').toUpperCase(Locale.ROOT);
    }
}
