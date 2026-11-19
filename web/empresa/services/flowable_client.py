from typing import Any
import requests
from requests.auth import HTTPBasicAuth

from config import (
    FLOWABLE_PROCESS_API,
    FLOWABLE_USER,
    FLOWABLE_PASSWORD,
    PROCESS_DEFINITION_KEY,
    START_MESSAGE_NAME,
)

# Info para mostrar a la empresa en el portal web, según el estado de la tarea en ejecución
# las keys son los taskDefinitionKey de Flowable, hay 2 generadas automáticamente
TAREAS_AMIGABLES = {
    "Propuesta": "Elaboración de propuesta comercial por Administración",
    "Revisar": "Revisión de propuesta comercial según observaciones",
    "Esperar": "Esperando respuesta de la empresa a la propuesta enviada",
    "Archivar": "Solicitud en proceso de archivo",
    "Nomina": "Recepción de nómina de participantes (esperando archivo)",
    "Lista": "Confección y validación de la lista definitiva de alumnos",
    "Material": "Preparación de materiales didácticos",
    "Activity_12i2hpf": "Evaluación de necesidades y recursos",
    "Aula": "Reserva de aula física",
    "Virtual": "Configuración y solicitud de aula virtual",
    "Equipo": "Contratación de equipamiento especial",
    "Activity_1018bdz": "Asignación de docente para el dictado",
    "Fecha": "Esperando llegada de la fecha programada de inicio",
    "Dictar": "Curso en desarrollo (dictado de clases)",
    "Informe": "Elaboración del informe final de resultados",
    "EnviarInforme": "Cierre y archivo del expediente institucional",
}

# Retorna un objeto HTTPBasicAuth para autenticación en Flowable REST API
def _get_auth() -> HTTPBasicAuth:
    
    return HTTPBasicAuth(FLOWABLE_USER, FLOWABLE_PASSWORD)

# Convierte un diccionario Python en la estructura que solicita Flowable REST para variables de proceso.
def _format_variables(variables_dict: dict[str, Any]) -> list[dict[str, Any]]:
    
    flowable_vars = []
    for name, value in variables_dict.items():
        if value is None:
            continue
        var_entry: dict[str, Any] = {"name": name, "value": value}
        if isinstance(value, bool):
            var_entry["type"] = "boolean"
        elif isinstance(value, int):
            var_entry["type"] = "integer"
        elif isinstance(value, float):
            var_entry["type"] = "double"
        else:
            var_entry["type"] = "string"
        flowable_vars.append(var_entry)
    return flowable_vars

# Convierte una lista de variables de Flowable a un diccionario Python
def _variables_list_to_dict(vars_list: list[dict[str, Any]]) -> dict[str, Any]:
    
    result = {}
    for item in vars_list or []:
        name = item.get("name")
        if name:
            result[name] = item.get("value")
    return result

# Comienza una nueva instancia de proceso en Flowable con las variables de la solicitud.
# Retorna (éxito, mensaje, process_instance_id).
def start_process_instance(
    solicitud_id: int,
    empresa_nombre: str,
    empresa_contacto: str,
    curso_nombre: str,
    curso_descripcion: str,
    cantidad_participantes: int,
    fechas_preferidas: str,
) -> tuple[bool, str, str | None]:
    
    auth = _get_auth()

    # Variables acordadas en el Contrato de Variables
    variables_payload = {
        "solicitudId": int(solicitud_id),
        "empresaNombre": str(empresa_nombre),
        "empresaContacto": str(empresa_contacto),
        "cursoNombre": str(curso_nombre),
        "cursoDescripcion": str(curso_descripcion),
        "cantidadParticipantes": int(cantidad_participantes),
        "fechasPreferidas": str(fechas_preferidas),
    }

    formatted_vars = _format_variables(variables_payload)

    # Intentar inicio mediante el mensaje BPMN 'solicitudMsg'
    try:
        msg_payload = {
            "message": START_MESSAGE_NAME,
            "variables": formatted_vars,
        }
        resp = requests.post(
            f"{FLOWABLE_PROCESS_API}/runtime/process-instances",
            json=msg_payload,
            auth=auth,
            timeout=8,
        )

        # Inicio exitoso
        if resp.status_code in (200, 201):
            data = resp.json()
            proc_id = data.get("id")
            return True, "Instancia iniciada correctamente mediante mensaje de solicitud.", proc_id

        # Inicio fallido (por ejemplo si el modelo espera inicio por definición de proceso)
        key_payload = {
            "processDefinitionKey": PROCESS_DEFINITION_KEY,
            "variables": formatted_vars,
        }
        resp_key = requests.post(
            f"{FLOWABLE_PROCESS_API}/runtime/process-instances",
            json=key_payload,
            auth=auth,
            timeout=8,
        )

        if resp_key.status_code in (200, 201):
            data = resp_key.json()
            proc_id = data.get("id")
            return True, "Instancia iniciada correctamente mediante clave de proceso.", proc_id

        return (
            False,
            f"Error al iniciar proceso en Flowable (HTTP {resp_key.status_code}): {resp_key.text}",
            None,
        )
    except requests.RequestException as exc:
        return False, f"No se pudo conectar con el motor Flowable ({exc}). Verifique que Docker esté activo.", None

# Consulta si una instancia está activa en el motor o si ya finalizó (historial)
def get_process_instance_status(process_instance_id: str) -> dict[str, Any]:
    
    if not process_instance_id:
        return {"active": False, "ended": False, "state": "desconocido"}

    auth = _get_auth()

    try:
        # Consultar en instancias en ejecución
        resp = requests.get(
            f"{FLOWABLE_PROCESS_API}/runtime/process-instances/{process_instance_id}",
            auth=auth,
            timeout=5,
        )
        if resp.ok:
            data = resp.json()
            return {
                "active": not data.get("ended", False) and not data.get("suspended", False),
                "ended": data.get("ended", False),
                "suspended": data.get("suspended", False),
                "businessKey": data.get("businessKey"),
                "state": "en_ejecucion",
            }

        # Si no está en runtime, consultar en historial (history)
        hist_resp = requests.get(
            f"{FLOWABLE_PROCESS_API}/history/historic-process-instances/{process_instance_id}",
            auth=auth,
            timeout=5,
        )
        if hist_resp.ok:
            hdata = hist_resp.json()
            end_time = hdata.get("endTime")
            delete_reason = hdata.get("deleteReason")
            return {
                "active": False,
                "ended": bool(end_time),
                "endTime": end_time,
                "deleteReason": delete_reason,
                "state": "finalizada" if end_time else "historial",
            }

        return {"active": False, "ended": False, "state": "no_encontrada"}
    except requests.RequestException:
        return {"active": False, "ended": False, "state": "error_conexion"}

# Obtiene las tareas de usuario activas y las actividades en ejecución para una instancia.
# Permite mostrarle a la empresa el progreso en vivo.
def get_active_tasks_and_activities(process_instance_id: str) -> list[dict[str, Any]]:
    
    if not process_instance_id:
        return []

    auth = _get_auth()
    actividades = []

    try:
        # Tareas de usuario activas en ejecución
        tasks_resp = requests.get(
            f"{FLOWABLE_PROCESS_API}/runtime/tasks",
            params={"processInstanceId": process_instance_id, "size": 50},
            auth=auth,
            timeout=5,
        )
        if tasks_resp.ok:
            for t in tasks_resp.json().get("data", []):
                key = t.get("taskDefinitionKey", "")
                nombre_crudo = t.get("name") or key
                actividades.append(
                    {
                        "id": t.get("id"),
                        "tipo": "tarea_usuario",
                        "nombre": TAREAS_AMIGABLES.get(key, nombre_crudo),
                        "key": key,
                        "assignee": t.get("assignee") or "Pendiente de asignación / reclamar",
                        "createTime": t.get("createTime"),
                    }
                )

        # Consultar ejecuciones activas (para eventos como recepción de nómina o timers)
        exec_resp = requests.get(
            f"{FLOWABLE_PROCESS_API}/runtime/executions",
            params={"processInstanceId": process_instance_id, "size": 50},
            auth=auth,
            timeout=5,
        )
        if exec_resp.ok:
            for ex in exec_resp.json().get("data", []):
                act_id = ex.get("activityId")
                # Si es una actividad especial como recibir nómina (ReceiveTask) o espera de fecha (Timer)
                if act_id in ("Nomina", "Fecha", "Esperar"):
                    # Evitar duplicar si ya fue listada
                    if not any(a.get("key") == act_id for a in actividades):
                        actividades.append(
                            {
                                "id": ex.get("id"),
                                "tipo": "espera_evento",
                                "nombre": TAREAS_AMIGABLES.get(act_id, act_id),
                                "key": act_id,
                                "assignee": "Sistema / Esperando comunicación",
                                "createTime": None,
                            }
                        )

        return actividades
    except requests.RequestException:
        return []

# Obtiene el diccionario con las variables actuales del proceso.
def get_process_variables(process_instance_id: str) -> dict[str, Any]:
    
    if not process_instance_id:
        return {}

    auth = _get_auth()

    try:
        # Intentar en runtime
        resp = requests.get(
            f"{FLOWABLE_PROCESS_API}/runtime/process-instances/{process_instance_id}/variables",
            auth=auth,
            timeout=5,
        )
        if resp.ok:
            return _variables_list_to_dict(resp.json())

        # Si ya terminó, consultar en historial
        hist_resp = requests.get(
            f"{FLOWABLE_PROCESS_API}/history/historic-process-instances/{process_instance_id}/variables",
            auth=auth,
            timeout=5,
        )
        if hist_resp.ok:
            return _variables_list_to_dict(hist_resp.json())

        return {}
    except requests.RequestException:
        return {}
