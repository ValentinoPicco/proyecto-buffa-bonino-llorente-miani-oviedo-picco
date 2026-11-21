package ar.edu.unrc.gestioncursos.simulador.service;

import ar.edu.unrc.gestioncursos.simulador.api.FlowableRestClient;
import ar.edu.unrc.gestioncursos.simulador.config.AppConfig;
import ar.edu.unrc.gestioncursos.simulador.model.SolicitudActiva;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.node.ArrayNode;
import com.fasterxml.jackson.databind.node.ObjectNode;

import java.time.OffsetDateTime;
import java.time.format.DateTimeParseException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * Acceso al runtime de Flowable para la seccion 4.2.2.
 *
 * El simulador no lee la base de datos: consulta la API REST y decide que
 * comunicaciones estan habilitadas a partir del estado real de la instancia.
 * - Aceptar, rechazar y pedir modificaciones: hay una suscripcion de mensaje
 *   con esos nombres (compuerta basada en eventos "Esperar").
 * - Enviar nomina: la actividad "Nomina" (receiveTask) esta activa.
 * - Cancelar: existe la suscripcion "cancelacionMsg" del evento de cancelacion.
 */
public final class SimuladorSolicitudes {

    private static final String ACTIVIDAD_PROPUESTA = "Propuesta";
    private static final String ACTIVIDAD_REVISAR = "Revisar";
    private static final String ACTIVIDAD_PREPARAR = "Preparar";
    private static final String ACTIVIDAD_LISTA = "Lista";
    private static final String ACTIVIDAD_MATERIAL = "Material";
    private static final String ACTIVIDAD_DICTAR = "Dictar";
    private static final String ACTIVIDAD_INFORME = "Informe";
    private static final String ACTIVIDAD_ARCHIVAR = "Archivar";
    private static final String ACTIVIDAD_CANCELACION = "Activity_048d5em";

    private final FlowableRestClient cliente;
    private final String processDefinitionKey;
    private final String mensajeAceptar;
    private final String mensajeRechazar;
    private final String mensajeModificar;
    private final String mensajeCancelar;
    private final String actividadNomina;
    private final CatalogoActividades catalogo;

    public SimuladorSolicitudes(FlowableRestClient cliente, AppConfig config) {
        this.cliente = cliente;
        this.processDefinitionKey = config.get("process.definitionKey", "Process_Curso");
        this.mensajeAceptar = config.get("message.accept", "Aceptación");
        this.mensajeRechazar = config.get("message.reject", "Rechazo");
        this.mensajeModificar = config.get("message.modify", "Solicitud de modificaciones");
        this.mensajeCancelar = config.get("message.cancel", "cancelacionMsg");
        this.actividadNomina = config.get("activity.nomina", "Nomina");
        this.catalogo = new CatalogoActividades(cliente);
    }

    /**
     * Devuelve todas las instancias activas del proceso, con sus variables,
     * actividades y suscripciones. Se pagina por si el entorno de prueba tiene
     * mas solicitudes que el tamano maximo de una respuesta.
     */
    public List<SolicitudActiva> listar() {
        List<SolicitudActiva> solicitudes = new ArrayList<>();
        int inicio = 0;
        int tamano = 100;

        while (true) {
            JsonNode respuesta = cliente.get("/runtime/process-instances", Map.of(
                    "processDefinitionKey", processDefinitionKey,
                    "includeProcessVariables", "true",
                    "sort", "startTime",
                    "order", "desc",
                    "start", String.valueOf(inicio),
                    "size", String.valueOf(tamano)));

            JsonNode datos = respuesta.path("data");
            if (!datos.isArray() || datos.isEmpty()) {
                break;
            }

            for (JsonNode instancia : datos) {
                solicitudes.add(convertir(instancia));
            }

            inicio += datos.size();
            int total = respuesta.path("total").asInt(inicio);
            if (inicio >= total) {
                break;
            }
        }

        return solicitudes;
    }

    public boolean puedeAceptar(SolicitudActiva solicitud) {
        return solicitud.tieneSuscripcion(mensajeAceptar);
    }

    public boolean puedeRechazar(SolicitudActiva solicitud) {
        return solicitud.tieneSuscripcion(mensajeRechazar);
    }

    public boolean puedeModificar(SolicitudActiva solicitud) {
        return solicitud.tieneSuscripcion(mensajeModificar);
    }

    public boolean puedeEnviarNomina(SolicitudActiva solicitud) {
        return solicitud.tieneActividad(actividadNomina);
    }

    public boolean puedeCancelar(SolicitudActiva solicitud) {
        return solicitud.tieneSuscripcion(mensajeCancelar);
    }

    public List<String> accionesHabilitadas(SolicitudActiva solicitud) {
        List<String> acciones = new ArrayList<>();
        if (puedeAceptar(solicitud)) {
            acciones.add("Aceptar propuesta");
        }
        if (puedeRechazar(solicitud)) {
            acciones.add("Rechazar propuesta");
        }
        if (puedeModificar(solicitud)) {
            acciones.add("Solicitar modificaciones");
        }
        if (puedeEnviarNomina(solicitud)) {
            acciones.add("Enviar nómina");
        }
        if (puedeCancelar(solicitud)) {
            acciones.add("Cancelar preparación");
        }
        return acciones;
    }

    public String estado(SolicitudActiva solicitud) {
        if (puedeAceptar(solicitud) || puedeRechazar(solicitud) || puedeModificar(solicitud)) {
            return "Esperando decisión de la empresa";
        }
        if (solicitud.tieneActividad(ACTIVIDAD_CANCELACION)) {
            return "Cancelación en curso";
        }
        if (puedeEnviarNomina(solicitud)) {
            return "Preparación: nómina pendiente";
        }
        if (solicitud.tieneActividad(ACTIVIDAD_PREPARAR)
                || solicitud.tieneActividad(ACTIVIDAD_LISTA)
                || solicitud.tieneActividad(ACTIVIDAD_MATERIAL)) {
            return "Preparación del curso";
        }
        if (solicitud.tieneActividad(ACTIVIDAD_PROPUESTA)) {
            return "Elaboración de la propuesta (área interna)";
        }
        if (solicitud.tieneActividad(ACTIVIDAD_REVISAR)) {
            return "Revisión de la propuesta (área interna)";
        }
        if (solicitud.tieneActividad(ACTIVIDAD_DICTAR)) {
            return "Curso en dictado";
        }
        if (solicitud.tieneActividad(ACTIVIDAD_INFORME)) {
            return "Informe de resultados pendiente";
        }
        if (solicitud.tieneActividad(ACTIVIDAD_ARCHIVAR)) {
            return "Cierre administrativo";
        }

        List<String> nombres = solicitud.nombresActividadesActivas();
        return nombres.isEmpty() ? "En ejecución" : "En ejecución: " + String.join(", ", nombres);
    }

    public void aceptar(SolicitudActiva solicitud, String fechaCurso) {
        enviarMensaje(solicitud, mensajeAceptar, "aceptar la propuesta",
                Map.of("fechaCurso", validarFecha(fechaCurso)));
    }

    public void rechazar(SolicitudActiva solicitud) {
        enviarMensaje(solicitud, mensajeRechazar, "rechazar la propuesta", Map.of());
    }

    public void solicitarModificaciones(SolicitudActiva solicitud, String observaciones) {
        enviarMensaje(solicitud, mensajeModificar, "solicitar modificaciones",
                Map.of("observacionesEmpresa", requerido(observaciones,
                        "Debe indicar las modificaciones solicitadas.")));
    }

    public void enviarNomina(SolicitudActiva solicitud, String nomina) {
        String ejecucion = solicitud.ejecucionDeActividad(actividadNomina);
        if (ejecucion == null) {
            throw new IllegalStateException(
                    "La recepción de nómina no está habilitada para esta solicitud. Actualice el listado.");
        }
        enviarSignal(ejecucion, Map.of("nominaParticipantes", requerido(nomina,
                "Debe indicar la nómina de participantes.")));
    }

    public void cancelar(SolicitudActiva solicitud) {
        enviarMensaje(solicitud, mensajeCancelar, "cancelar la preparación", Map.of());
    }

    private void enviarMensaje(SolicitudActiva solicitud, String evento, String accion, Map<String, String> variables) {
        String ejecucion = solicitud.ejecucionDeSuscripcion(evento);
        if (ejecucion == null) {
            throw new IllegalStateException("La comunicación \"" + accion
                    + "\" no está habilitada para esta solicitud. Actualice el listado.");
        }

        ObjectNode cuerpo = cliente.objectMapper().createObjectNode();
        cuerpo.put("action", "messageEventReceived");
        cuerpo.put("messageName", evento);
        cuerpo.set("variables", variables(variables));
        cliente.put("/runtime/executions/" + ejecucion, cuerpo);
    }

    private void enviarSignal(String ejecucion, Map<String, String> variables) {
        ObjectNode cuerpo = cliente.objectMapper().createObjectNode();
        cuerpo.put("action", "signal");
        cuerpo.set("variables", variables(variables));
        cliente.put("/runtime/executions/" + ejecucion, cuerpo);
    }

    private ArrayNode variables(Map<String, String> valores) {
        ArrayNode array = cliente.objectMapper().createArrayNode();
        valores.forEach((nombre, valor) -> {
            ObjectNode variable = array.addObject();
            variable.put("name", nombre);
            variable.put("value", valor);
        });
        return array;
    }

    private SolicitudActiva convertir(JsonNode instancia) {
        String id = instancia.path("id").asText("");
        String processDefinitionId = instancia.path("processDefinitionId").asText("");
        String businessKey = instancia.hasNonNull("businessKey")
                ? instancia.get("businessKey").asText()
                : null;

        Map<String, String> variables = leerVariables(instancia, id);
        List<String> actividades = new ArrayList<>();
        Map<String, String> ejecuciones = new LinkedHashMap<>();
        Map<String, String> suscripciones = new LinkedHashMap<>();

        JsonNode ejecucionesRespuesta = cliente.get("/runtime/executions", Map.of(
                "processInstanceId", id,
                "size", "100"));
        for (JsonNode ejecucion : ejecucionesRespuesta.path("data")) {
            String actividad = ejecucion.path("activityId").asText("");
            String ejecucionId = ejecucion.path("id").asText("");
            if (!actividad.isBlank() && !ejecucionId.isBlank()) {
                ejecuciones.putIfAbsent(actividad, ejecucionId);
                if (!actividades.contains(actividad)) {
                    actividades.add(actividad);
                }
            }
        }

        JsonNode suscripcionesRespuesta = cliente.get("/runtime/event-subscriptions", Map.of(
                "processInstanceId", id,
                "size", "100"));
        for (JsonNode suscripcion : suscripcionesRespuesta.path("data")) {
            String tipo = suscripcion.path("eventType").asText("");
            String evento = suscripcion.path("eventName").asText("");
            String ejecucionId = suscripcion.path("executionId").asText("");
            if ("message".equals(tipo) && !evento.isBlank() && !ejecucionId.isBlank()) {
                suscripciones.putIfAbsent(evento, ejecucionId);
            }
        }

        return new SolicitudActiva(
                id,
                businessKey,
                processDefinitionId,
                instancia.path("processDefinitionName").asText(""),
                leerInicio(instancia.path("startTime").asText("")),
                variables,
                actividades,
                ejecuciones,
                suscripciones,
                catalogo.nombres(processDefinitionId));
    }

    private Map<String, String> leerVariables(JsonNode instancia, String id) {
        JsonNode array = instancia.path("variables");
        if (!array.isArray()) {
            array = cliente.get("/runtime/process-instances/" + id + "/variables", Map.of());
        }

        Map<String, String> variables = new LinkedHashMap<>();
        for (JsonNode variable : array) {
            String nombre = variable.path("name").asText("");
            if (nombre.isBlank()) {
                continue;
            }
            JsonNode valor = variable.path("value");
            variables.put(nombre, valor.isMissingNode() || valor.isNull() ? "" : valor.asText());
        }
        return variables;
    }

    private static OffsetDateTime leerInicio(String texto) {
        if (texto == null || texto.isBlank()) {
            return null;
        }
        try {
            return OffsetDateTime.parse(texto);
        } catch (DateTimeParseException e) {
            return null;
        }
    }

    private static String validarFecha(String fecha) {
        String valor = requerido(fecha, "Debe indicar la fecha acordada.");
        try {
            OffsetDateTime.parse(valor);
        } catch (DateTimeParseException e) {
            throw new IllegalArgumentException(
                    "La fecha debe tener formato ISO-8601, por ejemplo 2026-11-18T15:30:00Z.");
        }
        return valor;
    }

    private static String requerido(String valor, String mensaje) {
        if (valor == null || valor.isBlank()) {
            throw new IllegalArgumentException(mensaje);
        }
        return valor.trim();
    }
}
