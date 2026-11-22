"""Análisis histórico de ejecuciones del proceso (Sección 4.3).

Consulta la información histórica de Flowable vía API REST y muestra por consola:
  4.3.1 Resultados de las solicitudes (cantidad y porcentaje).
  4.3.2 Duración promedio de las 3 ramas paralelas de preparación.
  4.3.3 Distribución de tareas de usuario completadas por administrativo y docente.
"""

from datetime import datetime
from getpass import getpass

import pandas as pd
import requests


# Configuración de conexión a Flowable
BASE_URL = "http://localhost:8080/flowable-ui/process-api"
PROCESS_KEY = "Process_Curso"

# Personal definido en el enunciado y CONTRATO_VARIABLES.md
PERSONAL_INSTITUCION = [
    ("admin_boss", "Administración (Jefe)"),
    ("admin2", "Administración"),
    ("teaching_leader", "Docentes (Jefe)"),
    ("teaching", "Docentes"),
    ("teaching2", "Docentes"),
]

# Resultados esperados (Seccion 4.3.1)
RESULTADOS_ORDEN = [
    "Curso finalizado",
    "Cancelación",
    "Rechazo de la propuesta",
    "Solicitud no viable",
    "Cierre por falta de respuesta",
]

MAPA_VARIABLE_RESULTADO = {
    "finalizado": "Curso finalizado",
    "curso_finalizado": "Curso finalizado",
    "cancelado": "Cancelación",
    "cancelacion": "Cancelación",
    "rechazado": "Rechazo de la propuesta",
    "rechazo": "Rechazo de la propuesta",
    "no_viable": "Solicitud no viable",
    "cerrado_sin_respuesta": "Cierre por falta de respuesta",
    "sin_respuesta": "Cierre por falta de respuesta",
}

# IDs BPMN de cancelación y ramas de preparación (Organizar_curso_de_capacitación.bpmn20.xml)
ACTIVIDADES_CANCELACION = {
    "Event_1g4xmqo",     # Recibir Cancelación
    "sid-31631671-5772-4D55-BF51-B1FF3F94A6C7",  # Marcar cancelado
    "sid-2DE91E9F-956A-4102-851E-74814609FFBF",  # Pausa cancelación
    "sid-0895FF62-ECF9-4BE6-9BEF-365FED2966D2",  # Fin cancelación
    "Event_0snigbc",     # Error fin cancelación
    "Event_0farfur",     # Boundary error en Preparar
    "Activity_12e0et1",  # Notificar Cierre
    "Event_0w2kitf",     # Fin por cancelación
}
ACTIVIDADES_RECURSOS = {"Aula", "Virtual", "Equipo"}

#tareas técnicas auxiliares que no corresponden al enunciado
TAREAS_TECNICAS_EXCLUIDAS ={
    "sid-2DE91E9F-956A-4102-851E-74814609FFBF",
    "UserTask_PausaCancel",
}


def consultar_todos(session, recurso, filtros):
    """Recupera todas las páginas de un endpoint REST de Flowable."""
    inicio = 0
    while True:
        respuesta = session.get(
            f"{BASE_URL}/{recurso}",
            params={**filtros, "start": inicio, "size": 100},
            timeout=30,
        )
        respuesta.raise_for_status()
        pagina = respuesta.json()
        registros = pagina.get("data", [])

        if not registros:
            break

        yield from registros
        inicio += len(registros)

        if inicio >= pagina.get("total", 0):
            break


def fecha_iso(valor):
    """Convierte una fecha ISO-8601 de Flowable a objeto datetime."""
    return datetime.fromisoformat(valor.replace("Z", "+00:00"))


def formatear_duracion(segundos):
    """Formatea una duración en segundos de forma legible."""
    if segundos is None:
        return "Sin datos"
    if segundos < 60:
        return f"{segundos:.1f} seg"

    total_seg = int(round(segundos))
    dias, resto = divmod(total_seg, 86400)
    horas, resto = divmod(resto, 3600)
    minutos, segs = divmod(resto, 60)

    partes = []
    if dias:
        partes.append(f"{dias}d")
    if horas or dias:
        partes.append(f"{horas}h")
    if minutos or horas or dias:
        partes.append(f"{minutos}m")
    partes.append(f"{segs}s")
    return f"{' '.join(partes)} ({segundos:.1f} seg)"


def obtener_variable(instancia, nombre):
    """Busca el valor de una variable de proceso incluida en la instancia."""
    for var in instancia.get("variables") or []:
        if var.get("name") == nombre:
            return var.get("value")
    return None


def clasificar_resultado(instancia, actividades):
    """Determina el resultado final de una instancia terminada.

    Prioriza la variable `resultadoProceso` definida en CONTRATO_VARIABLES.md
    y usa los eventos/actividades del BPMN como respaldo.
    """
    var_resultado = obtener_variable(instancia, "resultadoProceso")
    if isinstance(var_resultado, str):
        clave = var_resultado.strip().lower()
        if clave in MAPA_VARIABLE_RESULTADO:
            return MAPA_VARIABLE_RESULTADO[clave]

    end_id = instancia.get("endActivityId")
    act_ids_finalizadas = {
        a["activityId"] for a in actividades if a.get("endTime")
    }

    if end_id == "Fin":
        return "Curso finalizado"
    if end_id == "Event_0w2kitf" or obtener_variable(instancia, "cursoCancelado") is True or (act_ids_finalizadas & ACTIVIDADES_CANCELACION):
        return "Cancelación"
    if end_id == "Event_18edb9q" or "Activity_0iibzwu" in act_ids_finalizadas:
        return "Solicitud no viable"
    if end_id == "FinSinCurso" or "Archivar" in act_ids_finalizadas:
        if "Rechazado" in act_ids_finalizadas:
            return "Rechazo de la propuesta"
        return "Cierre por falta de respuesta"

    return "Otro / Sin clasificar"


def reporte_431_resultados(instancias_terminadas, actividades_por_instancia):
    """4.3.1: Cantidad y porcentaje de solicitudes por resultado."""
    print("\n" + "=" * 72)
    print("RESULTADOS DE LAS SOLICITUDES (4.3.1)")
    print("=" * 72)

    total = len(instancias_terminadas)
    if total == 0:
        print("No hay instancias terminadas de 'Process_Curso' todavía.")
        return

    conteo = {resultado: 0 for resultado in RESULTADOS_ORDEN}
    otros = 0

    for inst in instancias_terminadas:
        actividades = actividades_por_instancia.get(inst["id"], [])
        categoria = clasificar_resultado(inst, actividades)
        if categoria in conteo:
            conteo[categoria] += 1
        else:
            otros += 1

    filas = []
    for resultado in RESULTADOS_ORDEN:
        cantidad = conteo[resultado]
        porcentaje = (100.0 * cantidad / total) if total else 0.0
        filas.append({
            "Resultado": resultado,
            "Cantidad": cantidad,
            "Porcentaje (%)": f"{porcentaje:.1f}%",
        })

    if otros > 0:
        filas.append({
            "Resultado": "Otro / Sin clasificar",
            "Cantidad": otros,
            "Porcentaje (%)": f"{100.0 * otros / total:.1f}%",
        })

    filas.append({
        "Resultado": "TOTAL TERMINADAS",
        "Cantidad": total,
        "Porcentaje (%)": "100.0%",
    })

    df = pd.DataFrame(filas)
    print(df.to_string(index=False))


def calcular_duracion_rama_segundos(actividades, ids_inicio, ids_fin):
    """Calcula segundos entre el inicio más temprano y el fin más tardío."""
    inicios = [
        fecha_iso(a["startTime"])
        for a in actividades
        if a["activityId"] in ids_inicio and a.get("startTime")
    ]
    fines = [
        fecha_iso(a["endTime"])
        for a in actividades
        if a["activityId"] in ids_fin and a.get("endTime")
    ]
    if not inicios or not fines:
        return None
    delta = (max(fines) - min(inicios)).total_seconds()
    return max(delta, 0.0)


def reporte_432_preparacion_paralela(instancias_validas, actividades_por_instancia):
    """4.3.2: Duración promedio de cada rama paralela de preparación."""
    print("\n" + "=" * 72)
    print("ANÁLISIS DE LA PREPARACIÓN PARALELA (excluyendo canceladas)(4.3.2)")
    print("=" * 72)

    duraciones_inscripciones = []
    duraciones_materiales = []
    duraciones_recursos = []
    cursos_preparados = 0

    for inst in instancias_validas:
        actividades = actividades_por_instancia.get(inst["id"], [])
        act_ids_finalizadas = {
            a["activityId"] for a in actividades if a.get("endTime")
        }

        # Excluir instancias que sufrieron cancelación durante la preparación.
        if (obtener_variable(inst, "cursoCancelado") is True or act_ids_finalizadas & ACTIVIDADES_CANCELACION):
            continue

        # Verificar que el subproceso Preparar haya completado normalmente.
        preparacion_completa = (
            "SubFin" in act_ids_finalizadas
            or "ParFin" in act_ids_finalizadas
            or "Confirmar" in act_ids_finalizadas
        )
        if not preparacion_completa:
            continue

        cursos_preparados += 1

        # 1) Rama de inscripciones: desde activación de Nomina hasta fin de Lista.
        dur_ins = calcular_duracion_rama_segundos(
            actividades, {"Nomina"}, {"Lista"}
        )
        if dur_ins is None:
            dur_ins = calcular_duracion_rama_segundos(
                actividades, {"Lista"}, {"Lista"}
            )
        if dur_ins is not None:
            duraciones_inscripciones.append(dur_ins)

        # 2) Rama de materiales: desde activación hasta fin de Material.
        dur_mat = calcular_duracion_rama_segundos(
            actividades, {"Material"}, {"Material"}
        )
        if dur_mat is not None:
            duraciones_materiales.append(dur_mat)

        # 3) Rama de recursos: desde activación de Evaluar Recursos (Activity_12i2hpf)
        #    hasta que terminan todas las acciones de recursos seleccionadas.
        dur_rec = calcular_duracion_rama_segundos(
            actividades, {"Activity_12i2hpf"}, ACTIVIDADES_RECURSOS
        )
        if dur_rec is None:
            dur_rec = calcular_duracion_rama_segundos(
                actividades, {"Activity_12i2hpf"}, {"OrFin"}
            )
        if dur_rec is not None:
            duraciones_recursos.append(dur_rec)

    if cursos_preparados == 0:
        print("No hay cursos que hayan completado normalmente la preparación todavía.")
        return

    print(f"Cursos considerados (preparación completada sin cancelación): {cursos_preparados}\n")

    def promedio(lista):
        return (sum(lista) / len(lista)) if lista else None

    filas = [
        {
            "Rama paralela": "Inscripciones (Recibir nómina → Lista definitiva)",
            "Casos medidos": len(duraciones_inscripciones),
            "Duración promedio": formatear_duracion(promedio(duraciones_inscripciones)),
        },
        {
            "Rama paralela": "Materiales (Preparar materiales)",
            "Casos medidos": len(duraciones_materiales),
            "Duración promedio": formatear_duracion(promedio(duraciones_materiales)),
        },
        {
            "Rama paralela": "Recursos (Evaluar recursos → Acciones seleccionadas)",
            "Casos medidos": len(duraciones_recursos),
            "Duración promedio": formatear_duracion(promedio(duraciones_recursos)),
        },
    ]

    df = pd.DataFrame(filas)
    print(df.to_string(index=False))


def reporte_433_distribucion_tareas(session, ids_instancias_eliminadas):
    """4.3.3: Tareas de usuario completadas por cada administrativo y docente."""
    print("\n" + "=" * 72)
    print("DISTRIBUCIÓN DE TAREAS COMPLETADAS POR USUARIO (4.3.3)")
    print("=" * 72)

    tareas = consultar_todos(
        session,
        "history/historic-task-instances",
        {
            "processDefinitionKey": PROCESS_KEY,
            "finished": "true",
        },
    )

    conteo = {usuario: 0 for usuario, _ in PERSONAL_INSTITUCION}
    usuarios_extra = {}

    for tarea in tareas:
        # Excluir tareas de instancias eliminadas administrativamente.
        if tarea.get("processInstanceId") in ids_instancias_eliminadas:
            continue

        # Excluir tareas técnicas auxiliares
        if tarea.get("taskDefinitionKey") in TAREAS_TECNICAS_EXCLUIDAS:
            continue

        # Excluir tareas sin fecha de fin (pendientes).
        if not tarea.get("endTime"):
            continue

        # Excluir tareas interrumpidas o canceladas:
        # En Flowable 6, una tarea completada normalmente tiene deleteReason nulo
        # (o "completed"). Si fue cancelada/interrumpida, deleteReason trae el motivo.
        motivo_borrado = (tarea.get("deleteReason") or "").strip().lower()
        if motivo_borrado and motivo_borrado != "completed":
            continue

        asignado = tarea.get("assignee")
        if not asignado:
            continue

        if asignado in conteo:
            conteo[asignado] += 1
        else:
            usuarios_extra[asignado] = usuarios_extra.get(asignado, 0) + 1

    filas = []
    for usuario, rol in PERSONAL_INSTITUCION:
        filas.append({
            "Usuario": usuario,
            "Grupo / Rol": rol,
            "Tareas completadas": conteo[usuario],
        })

    for usuario, cantidad in sorted(usuarios_extra.items()):
        filas.append({
            "Usuario": usuario,
            "Grupo / Rol": "Otro usuario (fuera de nómina)",
            "Tareas completadas": cantidad,
        })

    total_tareas = sum(f["Tareas completadas"] for f in filas)
    filas.append({
        "Usuario": "TOTAL",
        "Grupo / Rol": "",
        "Tareas completadas": total_tareas,
    })

    df = pd.DataFrame(filas)
    print(df.to_string(index=False))


def main():
    usuario = input("Usuario de Flowable [admin]: ").strip() or "admin"
    clave = getpass("Contraseña: ")

    try:
        with requests.Session() as session:
            session.auth = (usuario, clave)

            # Recuperar todas las instancias del proceso (incluyendo variables)
            todas_instancias = list(
                consultar_todos(
                    session,
                    "history/historic-process-instances",
                    {
                        "processDefinitionKey": PROCESS_KEY,
                        "includeProcessVariables": "true",
                    },
                )
            )

            ids_eliminadas = {
                inst["id"] for inst in todas_instancias if inst.get("deleteReason")
            }
            instancias_validas = [
                inst for inst in todas_instancias if inst["id"] not in ids_eliminadas
            ]
            instancias_terminadas = [
                inst for inst in instancias_validas if inst.get("endTime")
            ]

            # Cargar actividades históricas por instancia válida
            actividades_por_instancia = {}
            for inst in instancias_validas:
                actividades_por_instancia[inst["id"]] = list(
                    consultar_todos(
                        session,
                        "history/historic-activity-instances",
                        {"processInstanceId": inst["id"]},
                    )
                )

            print(
                f"\nProceso analizado: {PROCESS_KEY} | "
                f"Instancias válidas: {len(instancias_validas)} "
                f"(terminadas: {len(instancias_terminadas)})"
            )

            reporte_431_resultados(instancias_terminadas, actividades_por_instancia)
            reporte_432_preparacion_paralela(
                instancias_validas, actividades_por_instancia
            )
            reporte_433_distribucion_tareas(session, ids_eliminadas)
            print()

    except requests.exceptions.ConnectionError:
        print(
            "\nError: No se pudo conectar con Flowable en "
            f"{BASE_URL}. Verificá que Docker esté corriendo (`docker compose ps`)."
        )
    except requests.exceptions.HTTPError as err:
        if err.response is not None and err.response.status_code == 401:
            print("\nError de autenticación (401): usuario o contraseña incorrectos.")
        else:
            print(f"\nError HTTP consultando Flowable: {err}")


if __name__ == "__main__":
    main()
