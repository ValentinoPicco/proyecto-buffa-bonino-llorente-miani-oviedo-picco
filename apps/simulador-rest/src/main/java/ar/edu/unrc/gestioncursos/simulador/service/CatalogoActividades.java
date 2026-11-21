package ar.edu.unrc.gestioncursos.simulador.service;

import ar.edu.unrc.gestioncursos.simulador.api.FlowableRestClient;
import com.fasterxml.jackson.databind.JsonNode;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.xml.sax.ErrorHandler;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;
import org.xml.sax.SAXParseException;

import javax.xml.XMLConstants;
import javax.xml.parsers.DocumentBuilderFactory;
import java.io.StringReader;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * Traduce los id de actividad del BPMN a sus nombres visibles.
 *
 * Para no depender de una version fija del proceso, se descarga el recurso
 * BPMN de la definicion deployada y se arma un mapa id -> name. El resultado se
 * cachea por definicion, porque el simulador refresca el listado con frecuencia
 * y no necesita volver a bajar el mismo XML.
 */
public final class CatalogoActividades {

    private final FlowableRestClient cliente;
    private final Map<String, Map<String, String>> cache = new HashMap<>();

    public CatalogoActividades(FlowableRestClient cliente) {
        this.cliente = cliente;
    }

    public Map<String, String> nombres(String processDefinitionId) {
        if (processDefinitionId == null || processDefinitionId.isBlank()) {
            return Map.of();
        }
        return cache.computeIfAbsent(processDefinitionId, this::cargar);
    }

    private Map<String, String> cargar(String processDefinitionId) {
        try {
            JsonNode definicion = cliente.get(
                    "/repository/process-definitions/" + processDefinitionId,
                    Map.of());
            String recurso = definicion.path("resource").asText("");
            if (recurso.isBlank()) {
                return Map.of();
            }

            // El campo "resource" apunta a los metadatos del recurso; el XML se
            // descarga desde el "contentUrl" que devuelve ese JSON.
            JsonNode metadatos = cliente.getUrl(recurso);
            String contenido = metadatos.path("contentUrl").asText("");
            if (contenido.isBlank()) {
                return Map.of();
            }
            return parsear(cliente.getTexto(contenido));
        } catch (RuntimeException e) {
            // Si el catalogo no se puede leer, la pantalla sigue funcionando con
            // los id de actividad. No conviene bloquear la simulacion por esto.
            return Map.of();
        }
    }

    private static Map<String, String> parsear(String xml) {
        try {
            DocumentBuilderFactory fabrica = DocumentBuilderFactory.newInstance();
            fabrica.setFeature(XMLConstants.FEATURE_SECURE_PROCESSING, true);
            fabrica.setFeature("http://apache.org/xml/features/disallow-doctype-decl", true);
            fabrica.setFeature("http://xml.org/sax/features/external-general-entities", false);
            fabrica.setFeature("http://xml.org/sax/features/external-parameter-entities", false);
            fabrica.setExpandEntityReferences(false);

            javax.xml.parsers.DocumentBuilder constructor = fabrica.newDocumentBuilder();
            constructor.setErrorHandler(new ErrorHandler() {
                @Override
                public void warning(SAXParseException e) {
                    // Sin salida por consola: el XML del BPMN es valido o se
                    // descarta el catalogo, pero no se ensucia la terminal.
                }

                @Override
                public void error(SAXParseException e) throws SAXException {
                    throw e;
                }

                @Override
                public void fatalError(SAXParseException e) throws SAXException {
                    throw e;
                }
            });

            Document documento = constructor.parse(new InputSource(new StringReader(xml)));
            Map<String, String> nombres = new LinkedHashMap<>();
            NodeList elementos = documento.getElementsByTagName("*");
            for (int i = 0; i < elementos.getLength(); i++) {
                Element elemento = (Element) elementos.item(i);
                String id = elemento.getAttribute("id");
                String nombre = elemento.getAttribute("name");
                if (!id.isBlank() && !nombre.isBlank()) {
                    nombres.put(id, nombre);
                }
            }
            return Map.copyOf(nombres);
        } catch (Exception e) {
            return Map.of();
        }
    }
}
