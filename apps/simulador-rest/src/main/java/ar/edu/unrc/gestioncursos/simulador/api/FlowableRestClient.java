package ar.edu.unrc.gestioncursos.simulador.api;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.NullNode;
import com.fasterxml.jackson.databind.node.ObjectNode;

import java.io.IOException;
import java.net.URI;
import java.net.URLEncoder;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.nio.charset.StandardCharsets;
import java.time.Duration;
import java.util.Base64;
import java.util.Map;
import java.util.StringJoiner;

/**
 * Cliente HTTP minimo para la API REST de Flowable.
 * Usa Basic Auth y devuelve los cuerpos JSON como JsonNode.
 */
public final class FlowableRestClient {

    private final String baseUrl;
    private final String authorization;
    private final Duration requestTimeout;
    private final HttpClient httpClient;
    private final ObjectMapper objectMapper;

    public FlowableRestClient(String baseUrl, String usuario, String password, int connectTimeoutMs, int requestTimeoutMs) {
        String normalizada = baseUrl == null ? "" : baseUrl.trim();
        while (normalizada.endsWith("/")) {
            normalizada = normalizada.substring(0, normalizada.length() - 1);
        }
        this.baseUrl = normalizada;
        this.authorization = "Basic " + Base64.getEncoder()
                .encodeToString((usuario + ":" + password).getBytes(StandardCharsets.UTF_8));
        this.requestTimeout = Duration.ofMillis(requestTimeoutMs);
        this.httpClient = HttpClient.newBuilder()
                .connectTimeout(Duration.ofMillis(connectTimeoutMs))
                .build();
        this.objectMapper = new ObjectMapper();
    }

    public JsonNode get(String path, Map<String, String> parametros) {
        HttpRequest request = baseRequest(uri(path, parametros)).GET().build();
        return ejecutar(request);
    }

    /**
     * GET sobre una URL absoluta devuelta por la propia API REST. Se usa para
     * metadatos de recursos, que Flowable publica con URL completa.
     */
    public JsonNode getUrl(String urlCompleta) {
        HttpRequest request = HttpRequest.newBuilder(URI.create(urlCompleta))
                .timeout(requestTimeout)
                .header("Accept", "application/json")
                .header("Authorization", authorization)
                .GET()
                .build();
        return ejecutar(request);
    }

    public JsonNode put(String path, ObjectNode cuerpo) {
        HttpRequest request = baseRequest(uri(path, Map.of()))
                .header("Content-Type", "application/json")
                .PUT(HttpRequest.BodyPublishers.ofString(serializar(cuerpo), StandardCharsets.UTF_8))
                .build();
        return ejecutar(request);
    }

    public JsonNode post(String path, ObjectNode cuerpo) {
        HttpRequest request = baseRequest(uri(path, Map.of()))
                .header("Content-Type", "application/json")
                .POST(HttpRequest.BodyPublishers.ofString(serializar(cuerpo), StandardCharsets.UTF_8))
                .build();
        return ejecutar(request);
    }

    /**
     * Descarga un recurso de texto (por ejemplo el XML del BPMN) usando una URL
     * absoluta devuelta por la propia API REST.
     */
    public String getTexto(String urlCompleta) {
        HttpRequest request = HttpRequest.newBuilder(URI.create(urlCompleta))
                .timeout(requestTimeout)
                .header("Accept", "application/xml, text/xml, */*")
                .header("Authorization", authorization)
                .GET()
                .build();
        try {
            HttpResponse<String> response = httpClient.send(request,
                    HttpResponse.BodyHandlers.ofString(StandardCharsets.UTF_8));
            int status = response.statusCode();
            if (status < 200 || status >= 300) {
                throw new RestException(status, mensajeDeError(response.body(), status));
            }
            return response.body();
        } catch (IOException e) {
            throw new RestException("No se pudo descargar el recurso " + urlCompleta + ": " + e.getMessage(), e);
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
            throw new RestException("La descarga del recurso fue interrumpida.", e);
        }
    }

    public String baseUrl() {
        return baseUrl;
    }

    public ObjectMapper objectMapper() {
        return objectMapper;
    }

    private HttpRequest.Builder baseRequest(URI uri) {
        return HttpRequest.newBuilder(uri)
                .timeout(requestTimeout)
                .header("Accept", "application/json")
                .header("Authorization", authorization);
    }

    private URI uri(String path, Map<String, String> parametros) {
        String ruta = path.startsWith("/") ? path : "/" + path;
        StringBuilder url = new StringBuilder(baseUrl).append(ruta);
        if (parametros != null && !parametros.isEmpty()) {
            StringJoiner query = new StringJoiner("&");
            parametros.forEach((clave, valor) -> query.add(
                    URLEncoder.encode(clave, StandardCharsets.UTF_8)
                            + "="
                            + URLEncoder.encode(valor, StandardCharsets.UTF_8).replace("+", "%20")));
            url.append('?').append(query);
        }
        return URI.create(url.toString());
    }

    private JsonNode ejecutar(HttpRequest request) {
        try {
            HttpResponse<String> response = httpClient.send(request, HttpResponse.BodyHandlers.ofString(StandardCharsets.UTF_8));
            int status = response.statusCode();
            String cuerpo = response.body();

            if (status < 200 || status >= 300) {
                throw new RestException(status, mensajeDeError(cuerpo, status));
            }
            if (cuerpo == null || cuerpo.isBlank()) {
                return NullNode.getInstance();
            }
            return objectMapper.readTree(cuerpo);
        } catch (IOException e) {
            throw new RestException("No se pudo comunicar con Flowable en " + baseUrl + ": " + e.getMessage(), e);
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
            throw new RestException("La llamada a Flowable fue interrumpida.", e);
        }
    }

    private String serializar(ObjectNode cuerpo) {
        try {
            return objectMapper.writeValueAsString(cuerpo);
        } catch (IOException e) {
            throw new RestException("No se pudo serializar el cuerpo JSON de la peticion.", e);
        }
    }

    private String mensajeDeError(String cuerpo, int status) {
        if (cuerpo != null && !cuerpo.isBlank()) {
            try {
                JsonNode json = objectMapper.readTree(cuerpo);
                if (json.hasNonNull("errorMessage")) {
                    return json.get("errorMessage").asText();
                }
            } catch (IOException ignored) {
                // El cuerpo no era JSON; se usa tal cual.
            }
            return cuerpo;
        }
        return "HTTP " + status;
    }
}
