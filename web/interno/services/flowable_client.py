from typing import Any
import requests
from requests.auth import HTTPBasicAuth

from config import FLOWABLE_PROCESS_API

ROLE_LABELS_BY_USER = {
    "admin_boss": "Jefe Administrativo",
    "admin2": "Administrativo",
    "teaching_leader": "Jefe del Equipo Docente",
    "teaching": "Equipo Docente",
    "teaching2": "Equipo Docente",
}

DOCENTES_DISPONIBLES = [
    {"id": "teaching_leader", "nombre": "teaching leader (Jefe del Equipo Docente)"},
    {"id": "teaching", "nombre": "teaching the first (Docente 1)"},
    {"id": "teaching2", "nombre": "teaching the second (Docente 2)"},
]


def _variables_list_to_dict(vars_list: list[dict[str, Any]]) -> dict[str, Any]:
    """Convierte el array de variables de Flowable REST en un diccionario clave -> valor."""
    result = {}
    for item in vars_list or []:
        name = item.get("name")
        if name:
            result[name] = item.get("value")
    return result


def authenticate_user(username: str, password: str) -> dict[str, Any] | None:
    """
    Autentica un miembro del personal contra Flowable Identity REST API
    (/flowable-ui/process-api/identity/users/{username}) usando Basic Auth
    y obtiene sus datos de perfil y grupos asignados ('adm' o 'teach').
    """
    username = (username or "").strip()
    if not username or not password:
        return None

    auth = HTTPBasicAuth(username, password)

    try:
        resp = requests.get(
            f"{FLOWABLE_PROCESS_API}/identity/users/{username}",
            auth=auth,
            timeout=5,
        )
        if resp.status_code != 200:
            return None

        user_data = resp.json()
        groups_resp = requests.get(
            f"{FLOWABLE_PROCESS_API}/identity/groups",
            params={"member": username},
            auth=auth,
            timeout=5,
        )
        groups = (
            [g["id"] for g in groups_resp.json().get("data", [])]
            if groups_resp.ok
            else []
        )

        return {
            "id": user_data["id"],
            "firstName": user_data.get("firstName", ""),
            "lastName": user_data.get("lastName", ""),
            "email": user_data.get("email", ""),
            "groups": groups,
            "roleLabel": ROLE_LABELS_BY_USER.get(username, ", ".join(groups) or "Personal"),
        }
    except requests.RequestException:
        return None


def _normalize_flowable_task(raw_task: dict[str, Any]) -> dict[str, Any]:
    """Normaliza la estructura de una tarea devuelta por Flowable REST."""
    variables = raw_task.get("variables")
    if isinstance(variables, list):
        variables = _variables_list_to_dict(variables)
    elif not isinstance(variables, dict):
        variables = {}

    return {
        "id": raw_task["id"],
        "name": raw_task.get("name") or raw_task.get("taskDefinitionKey", "Tarea sin nombre"),
        "taskDefinitionKey": raw_task.get("taskDefinitionKey", ""),
        "processInstanceId": raw_task.get("processInstanceId", ""),
        "assignee": raw_task.get("assignee"),
        "createTime": raw_task.get("createTime", ""),
        "variables": variables,
    }


def get_tasks_for_user(
    username: str,
    password: str,
    groups: list[str],
) -> dict[str, Any]:
    """
    Devuelve las tareas asignadas al usuario y las tareas candidatas disponibles para su grupo.
    """
    auth = HTTPBasicAuth(username, password)

    try:
        # 1. Tareas asignadas directamente al usuario
        assigned_resp = requests.get(
            f"{FLOWABLE_PROCESS_API}/runtime/tasks",
            params={
                "assignee": username,
                "includeProcessVariables": "true",
                "sort": "createTime",
                "order": "desc",
                "size": 100,
            },
            auth=auth,
            timeout=5,
        )
        assigned_tasks = [
            _normalize_flowable_task(t)
            for t in (assigned_resp.json().get("data", []) if assigned_resp.ok else [])
        ]

        # 2. Tareas candidatas para sus grupos ('adm' o 'teach')
        claimable_map: dict[str, dict[str, Any]] = {}
        for grp in groups:
            cand_resp = requests.get(
                f"{FLOWABLE_PROCESS_API}/runtime/tasks",
                params={
                    "candidateGroup": grp,
                    "includeProcessVariables": "true",
                    "size": 100,
                },
                auth=auth,
                timeout=5,
            )
            if cand_resp.ok:
                for t in cand_resp.json().get("data", []):
                    claimable_map[t["id"]] = _normalize_flowable_task(t)

        # 3. Tareas donde el usuario es candidateUser directo
        cand_user_resp = requests.get(
            f"{FLOWABLE_PROCESS_API}/runtime/tasks",
            params={
                "candidateUser": username,
                "includeProcessVariables": "true",
                "size": 100,
            },
            auth=auth,
            timeout=5,
        )
        if cand_user_resp.ok:
            for t in cand_user_resp.json().get("data", []):
                claimable_map[t["id"]] = _normalize_flowable_task(t)

        return {
            "assigned": assigned_tasks,
            "claimable": list(claimable_map.values()),
        }
    except requests.RequestException as exc:
        return {
            "assigned": [],
            "claimable": [],
            "error": f"No se pudo conectar con Flowable REST API ({exc}). Verifique que el contenedor de Flowable esté en ejecución.",
        }


def get_task_by_id(
    username: str,
    password: str,
    task_id: str,
) -> dict[str, Any] | None:
    """Obtiene el detalle de una tarea específica junto con las variables de su instancia de proceso."""
    auth = HTTPBasicAuth(username, password)

    try:
        resp = requests.get(
            f"{FLOWABLE_PROCESS_API}/runtime/tasks/{task_id}",
            auth=auth,
            timeout=5,
        )
        if not resp.ok:
            return None
        task_data = resp.json()

        proc_id = task_data.get("processInstanceId")
        variables = {}
        if proc_id:
            var_resp = requests.get(
                f"{FLOWABLE_PROCESS_API}/runtime/process-instances/{proc_id}/variables",
                auth=auth,
                timeout=5,
            )
            if var_resp.ok:
                variables = _variables_list_to_dict(var_resp.json())

        task_data["variables"] = variables
        return _normalize_flowable_task(task_data)
    except requests.RequestException:
        return None


def claim_task(
    username: str,
    password: str,
    task_id: str,
) -> tuple[bool, str]:
    """Reclama una tarea candidata asignándola al usuario actual."""
    auth = HTTPBasicAuth(username, password)

    try:
        resp = requests.post(
            f"{FLOWABLE_PROCESS_API}/runtime/tasks/{task_id}",
            json={"action": "claim", "assignee": username},
            auth=auth,
            timeout=5,
        )
        if resp.status_code == 200:
            return True, "Tarea reclamada exitosamente."
        return False, f"Error al reclamar tarea en Flowable (HTTP {resp.status_code}): {resp.text}"
    except requests.RequestException as exc:
        return False, f"Error de conexión con Flowable: {exc}"


def complete_task(
    username: str,
    password: str,
    task_id: str,
    variables: list[dict[str, Any]],
) -> tuple[bool, str]:
    """Completa una tarea en Flowable enviando el listado de variables actualizadas."""
    auth = HTTPBasicAuth(username, password)

    try:
        resp = requests.post(
            f"{FLOWABLE_PROCESS_API}/runtime/tasks/{task_id}",
            json={
                "action": "complete",
                "variables": variables,
            },
            auth=auth,
            timeout=5,
        )
        if resp.status_code == 200:
            return True, "Tarea completada exitosamente."
        return False, f"Error al completar tarea en Flowable (HTTP {resp.status_code}): {resp.text}"
    except requests.RequestException as exc:
        return False, f"Error de conexión con Flowable: {exc}"
