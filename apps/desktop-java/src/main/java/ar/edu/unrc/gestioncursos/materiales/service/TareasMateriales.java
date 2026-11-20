package ar.edu.unrc.gestioncursos.materiales.service;

import ar.edu.unrc.gestioncursos.materiales.model.TareaMaterial;
import org.flowable.engine.TaskService;
import org.flowable.task.api.Task;

import java.util.List;
import java.util.Map;

/**
 * Operaciones de negocio sobre las tareas "Preparar materiales".
 *
 * La app solo muestra las tareas para las que el usuario es candidato o que ya
 * tiene asignadas. Al completar, deja la variable de proceso
 * materialesPreparados = true, segun el contrato de variables del proyecto.
 */
public final class TareasMateriales {

    private final TaskService taskService;
    private final String taskDefinitionKey;

    public TareasMateriales(TaskService taskService, String taskDefinitionKey) {
        this.taskService = taskService;
        this.taskDefinitionKey = taskDefinitionKey;
    }

    public List<TareaMaterial> buscar(String usuario) {
        return taskService.createTaskQuery()
                .taskDefinitionKey(taskDefinitionKey)
                .taskCandidateOrAssigned(usuario)
                .includeProcessVariables()
                .orderByTaskCreateTime()
                .asc()
                .list()
                .stream()
                .map(TareaMaterial::desde)
                .toList();
    }

    public void reclamar(String tareaId, String usuario) {
        Task tarea = buscarPorId(tareaId);
        if (tarea == null) {
            throw new IllegalStateException("La tarea ya no existe. Actualice el listado.");
        }
        if (tarea.getAssignee() != null && !tarea.getAssignee().isBlank()) {
            throw new IllegalStateException(
                    "La tarea ya fue reclamada por '" + tarea.getAssignee() + "'.");
        }
        taskService.claim(tareaId, usuario);
    }

    public void completar(String tareaId, String usuario) {
        Task tarea = buscarPorId(tareaId);
        if (tarea == null) {
            throw new IllegalStateException("La tarea ya no existe. Actualice el listado.");
        }
        if (!taskDefinitionKey.equals(tarea.getTaskDefinitionKey())) {
            throw new IllegalStateException("La tarea seleccionada no es de preparacion de materiales.");
        }
        if (tarea.getAssignee() == null || !tarea.getAssignee().equals(usuario)) {
            throw new IllegalStateException("Primero debe reclamar la tarea para poder completarla.");
        }
        taskService.complete(tareaId, Map.of("materialesPreparados", Boolean.TRUE));
    }

    private Task buscarPorId(String tareaId) {
        return taskService.createTaskQuery()
                .taskId(tareaId)
                .singleResult();
    }
}
