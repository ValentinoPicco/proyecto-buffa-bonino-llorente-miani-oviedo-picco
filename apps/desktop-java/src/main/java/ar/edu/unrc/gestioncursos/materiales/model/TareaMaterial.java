package ar.edu.unrc.gestioncursos.materiales.model;

import org.flowable.task.api.Task;

import java.util.Date;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * Vista de solo lectura de una tarea "Preparar materiales" con las variables
 * de su instancia de proceso.
 */
public final class TareaMaterial {

    private final String id;
    private final String nombre;
    private final String asignadoA;
    private final String processInstanceId;
    private final Date creada;
    private final Map<String, Object> variables;

    private TareaMaterial(String id, String nombre, String asignadoA, String processInstanceId,
                          Date creada, Map<String, Object> variables) {
        this.id = id;
        this.nombre = nombre;
        this.asignadoA = asignadoA;
        this.processInstanceId = processInstanceId;
        this.creada = creada;
        this.variables = variables;
    }

    public static TareaMaterial desde(Task tarea) {
        Map<String, Object> variables = tarea.getProcessVariables() == null
                ? Map.of()
                : new LinkedHashMap<>(tarea.getProcessVariables());
        return new TareaMaterial(
                tarea.getId(),
                tarea.getName(),
                tarea.getAssignee(),
                tarea.getProcessInstanceId(),
                tarea.getCreateTime(),
                variables);
    }

    public String id() {
        return id;
    }

    public String nombre() {
        return nombre;
    }

    public String asignadoA() {
        return asignadoA;
    }

    public String processInstanceId() {
        return processInstanceId;
    }

    public Date creada() {
        return creada;
    }

    public Map<String, Object> variables() {
        return variables;
    }

    public boolean estaDisponible() {
        return asignadoA == null || asignadoA.isBlank();
    }

    public boolean estaAsignadaA(String usuario) {
        return usuario != null && usuario.equals(asignadoA);
    }

    public Object variable(String clave) {
        return variables.get(clave);
    }

    public String texto(String clave) {
        Object valor = variables.get(clave);
        return valor == null ? "" : String.valueOf(valor);
    }
}
