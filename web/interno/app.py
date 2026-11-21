from datetime import datetime
from functools import wraps
from flask import (
    Flask,
    flash,
    redirect,
    render_template,
    request,
    send_from_directory,
    session,
    url_for,
)

from config import PDF_OUTPUT_DIR, PORT, PORTAL_EMPRESA_URL, SECRET_KEY
from services.db_client import (
    sync_estado_solicitud,
    sync_informe_to_db,
    sync_participantes_to_db,
    sync_propuesta_to_db,
)
from services.flowable_client import (
    DOCENTES_DISPONIBLES,
    authenticate_user,
    claim_task,
    complete_task,
    get_task_by_id,
    get_tasks_for_user,
)
from services.pdf_generator import generate_informe_pdf, generate_propuesta_pdf

app = Flask(__name__)
app.secret_key = SECRET_KEY

# Mapeo de taskDefinitionKey (del BPMN de Picco) a plantillas HTML
TASK_TEMPLATES = {
    "Propuesta": "tasks/propuesta.html",
    "Revisar": "tasks/revisar.html",
    "Archivar": "tasks/archivar.html",
    "Lista": "tasks/lista.html",
    "Activity_12i2hpf": "tasks/recursos.html",
    "Activity_1018bdz": "tasks/definir_docente.html",
    "Dictar": "tasks/dictar.html",
    "Informe": "tasks/informe.html",
    "EnviarInforme": "tasks/enviar_informe.html",
}


def login_required(view_func):
    @wraps(view_func)
    def wrapped(*args, **kwargs):
        if "user" not in session:
            return redirect(url_for("login"))
        return view_func(*args, **kwargs)

    return wrapped


@app.context_processor
def inject_globals():
    pdfs = sorted(
        [p.name for p in PDF_OUTPUT_DIR.glob("*.pdf")],
        reverse=True,
    )
    return {
        "current_user": session.get("user"),
        "generated_pdfs": pdfs,
        "portal_empresa_url": PORTAL_EMPRESA_URL,
    }


@app.route("/")
def index():
    if "user" in session:
        return redirect(url_for("bandeja"))
    return redirect(url_for("login"))


@app.route("/login", methods=["GET", "POST"])
def login():
    if request.method == "POST":
        username = request.form.get("username", "").strip()
        password = request.form.get("password", "")

        user_info = authenticate_user(username, password)
        if user_info:
            session["user"] = user_info
            session["password"] = password
            flash(
                f"Bienvenido/a, {user_info['id']} ({user_info['roleLabel']}).",
                "success",
            )
            return redirect(url_for("bandeja"))

        flash(
            "Credenciales inválidas o servicio de Flowable IDM no disponible.",
            "error",
        )
    return render_template("login.html")


@app.route("/logout", methods=["POST"])
def logout():
    session.clear()
    flash("Sesión cerrada correctamente.", "info")
    return redirect(url_for("login"))


@app.route("/bandeja")
@login_required
def bandeja():
    user = session["user"]
    password = session.get("password", "")
    result = get_tasks_for_user(
        username=user["id"],
        password=password,
        groups=user.get("groups", []),
    )
    if result.get("error"):
        flash(result["error"], "warning")

    return render_template(
        "bandeja.html",
        assigned_tasks=result.get("assigned", []),
        claimable_tasks=result.get("claimable", []),
    )


@app.route("/tasks/<task_id>/claim", methods=["POST"])
@login_required
def claim(task_id: str):
    user = session["user"]
    password = session.get("password", "")
    ok, msg = claim_task(
        username=user["id"],
        password=password,
        task_id=task_id,
    )
    flash(msg, "success" if ok else "error")
    return redirect(url_for("bandeja"))


@app.route("/tasks/<task_id>", methods=["GET", "POST"])
@login_required
def task_detail(task_id: str):
    user = session["user"]
    password = session.get("password", "")

    task = get_task_by_id(
        username=user["id"],
        password=password,
        task_id=task_id,
    )
    if not task:
        flash("No se encontró la tarea solicitada o ya fue completada.", "error")
        return redirect(url_for("bandeja"))

    # Regla del enunciado (Sección 2): Las tareas con grupo candidato y sin usuario asignado
    # deben ser reclamadas antes de completarse.
    if task.get("assignee") != user["id"]:
        flash(
            "Debes reclamar esta tarea antes de poder completarla.",
            "warning",
        )
        return redirect(url_for("bandeja"))

    task_key = task.get("taskDefinitionKey", "")
    proc_vars = task.get("variables", {})
    proc_id = task.get("processInstanceId", "sin-id")
    sol_id = proc_vars.get("solicitudId")

    # Sincronizar el estado en institucion_db al ingresar a tareas de etapas posteriores
    # para que el Portal de Empresas (web/empresa) refleje la transición inmediatamente.
    if task_key in ("Lista", "Activity_12i2hpf", "Activity_1018bdz"):
        sync_estado_solicitud(proc_id, "en_preparacion", solicitud_id=sol_id)
    elif task_key in ("Dictar", "Informe"):
        sync_estado_solicitud(proc_id, "en_curso", solicitud_id=sol_id)

    if request.method == "POST":
        variables_to_send = []

        # 1. Registrar y Elaborar propuesta (Propuesta) o Revisar propuesta (Revisar)
        if task_key in ("Propuesta", "Revisar"):
            empresa_nombre = request.form.get("empresaNombre", proc_vars.get("empresaNombre", "")).strip()
            empresa_contacto = request.form.get("empresaContacto", proc_vars.get("empresaContacto", "")).strip()
            curso_nombre = request.form.get("cursoNombre", proc_vars.get("cursoNombre", "")).strip()
            programa = request.form.get("programaPropuesto", "").strip()
            presupuesto_raw = request.form.get("presupuesto", "0").strip()
            fechas_posibles = request.form.get("fechasPosibles", "").strip()
            notas_revision = request.form.get("notasRevision", "").strip()

            if not programa or not presupuesto_raw or not fechas_posibles:
                flash("Completa el programa, el presupuesto y las fechas posibles.", "error")
                return redirect(url_for("task_detail", task_id=task_id))

            try:
                presupuesto_val = float(presupuesto_raw)
            except ValueError:
                flash("El presupuesto debe ser un valor numérico válido.", "error")
                return redirect(url_for("task_detail", task_id=task_id))

            prev_version = int(proc_vars.get("versionPropuesta") or 0)
            new_version = 1 if task_key == "Propuesta" else max(2, prev_version + 1)

            pdf_path = generate_propuesta_pdf(
                process_instance_id=proc_id,
                version=new_version,
                empresa_nombre=empresa_nombre,
                empresa_contacto=empresa_contacto,
                curso_nombre=curso_nombre,
                programa=programa,
                presupuesto=presupuesto_val,
                fechas_posibles=fechas_posibles,
                observaciones_previas=notas_revision or proc_vars.get("observacionesEmpresa", ""),
            )

            sync_propuesta_to_db(
                process_instance_id=proc_id,
                programa=programa,
                presupuesto=presupuesto_val,
                fechas_posibles=fechas_posibles,
                version=new_version,
                pdf_nombre=pdf_path.name,
                observaciones_empresa=notas_revision or proc_vars.get("observacionesEmpresa", ""),
                solicitud_id=sol_id,
            )

            # Enunciado 1.1: "El contador de recordatorios se reinicia con cada nueva versión enviada de la propuesta"
            variables_to_send = [
                {"name": "empresaNombre", "type": "string", "value": empresa_nombre},
                {"name": "empresaContacto", "type": "string", "value": empresa_contacto},
                {"name": "cursoNombre", "type": "string", "value": curso_nombre},
                {"name": "programaPropuesto", "type": "string", "value": programa},
                {"name": "presupuesto", "type": "double", "value": presupuesto_val},
                {"name": "fechasPosibles", "type": "string", "value": fechas_posibles},
                {"name": "versionPropuesta", "type": "integer", "value": new_version},
                {"name": "propuestaPdfNombre", "type": "string", "value": pdf_path.name},
                {"name": "recordatorios", "type": "integer", "value": 0},
            ]
            flash(f"Se generó el documento PDF: {pdf_path.name}", "info")

        # 2. Archivar solicitud (Archivar)
        elif task_key == "Archivar":
            motivo = request.form.get("motivoArchivo", "").strip()
            if not motivo:
                flash("Indica el motivo de archivo de la solicitud.", "error")
                return redirect(url_for("task_detail", task_id=task_id))

            resultado_actual = proc_vars.get("resultadoProceso")
            if resultado_actual not in ("rechazado", "cerrado_sin_respuesta"):
                rec_count = int(proc_vars.get("recordatorios") or 0)
                resultado_actual = "cerrado_sin_respuesta" if rec_count >= 2 else "rechazado"

            sync_estado_solicitud(proc_id, resultado_actual, solicitud_id=sol_id)

            variables_to_send = [
                {"name": "motivoArchivo", "type": "string", "value": motivo},
                {"name": "solicitudArchivada", "type": "boolean", "value": True},
                {"name": "resultadoProceso", "type": "string", "value": resultado_actual},
            ]

        # 3. Confeccionar lista definitiva (Lista)
        elif task_key == "Lista":
            lista_def = request.form.get("listaDefinitiva", "").strip()
            obs_lista = request.form.get("observacionesLista", "").strip()
            if not lista_def:
                flash("La lista definitiva de participantes no puede estar vacía.", "error")
                return redirect(url_for("task_detail", task_id=task_id))

            sync_participantes_to_db(
                process_instance_id=proc_id,
                lista_definitiva=lista_def,
                solicitud_id=sol_id,
            )

            variables_to_send = [
                {"name": "listaDefinitiva", "type": "string", "value": lista_def},
                {"name": "observacionesLista", "type": "string", "value": obs_lista},
            ]

        # 4. Evaluar Recursos (Activity_12i2hpf)
        elif task_key == "Activity_12i2hpf":
            req_aula = request.form.get("requiereAula") == "true"
            req_plat = request.form.get("requierePlataforma") == "true"
            req_equip = request.form.get("requiereEquipamiento") == "true"

            # Enunciado 1.2 y 4.1.3: "La evaluación de recursos deberá seleccionar al menos una de las alternativas."
            if not (req_aula or req_plat or req_equip):
                flash(
                    "Debes seleccionar al menos un recurso (Aula Física, Aula Virtual o Equipamiento Especial).",
                    "error",
                )
                return redirect(url_for("task_detail", task_id=task_id))

            sync_estado_solicitud(proc_id, "en_preparacion", solicitud_id=sol_id)

            variables_to_send = [
                {"name": "requiereAula", "type": "boolean", "value": req_aula},
                {"name": "requierePlataforma", "type": "boolean", "value": req_plat},
                {"name": "requiereEquipamiento", "type": "boolean", "value": req_equip},
            ]

        # 5. Definir Docente que desarrolla el curso (Activity_1018bdz)
        elif task_key == "Activity_1018bdz":
            docente_sel = request.form.get("docenteSeleccionado", "").strip()
            valid_ids = {d["id"] for d in DOCENTES_DISPONIBLES}
            if docente_sel not in valid_ids:
                flash("Selecciona un docente válido del equipo docente.", "error")
                return redirect(url_for("task_detail", task_id=task_id))

            sync_estado_solicitud(proc_id, "en_curso", solicitud_id=sol_id)

            variables_to_send = [
                {"name": "docenteSeleccionado", "type": "string", "value": docente_sel},
            ]

        # 6. Desarrollar curso (Dictar)
        elif task_key == "Dictar":
            obs_dictado = request.form.get("observacionesDictado", "").strip()
            fecha_fin = request.form.get("fechaFinDictado", datetime.now().strftime("%Y-%m-%d %H:%M")).strip()
            if not obs_dictado:
                flash("Ingresa las observaciones de finalización del dictado.", "error")
                return redirect(url_for("task_detail", task_id=task_id))

            sync_estado_solicitud(proc_id, "en_curso", solicitud_id=sol_id)

            variables_to_send = [
                {"name": "observacionesDictado", "type": "string", "value": obs_dictado},
                {"name": "fechaFinDictado", "type": "string", "value": fecha_fin},
                {"name": "cursoDictado", "type": "boolean", "value": True},
            ]

        # 7. Elaborar informe de resultados (Informe)
        elif task_key == "Informe":
            informe_texto = request.form.get("informeResultados", "").strip()
            asistencia_raw = request.form.get("porcentajeAsistencia", "100").strip()
            if not informe_texto:
                flash("El contenido del informe de resultados es obligatorio.", "error")
                return redirect(url_for("task_detail", task_id=task_id))

            try:
                asistencia_val = max(0, min(100, int(asistencia_raw)))
            except ValueError:
                asistencia_val = 100

            pdf_path = generate_informe_pdf(
                process_instance_id=proc_id,
                empresa_nombre=proc_vars.get("empresaNombre", "Empresa Solicitante"),
                curso_nombre=proc_vars.get("cursoNombre", "Curso de Capacitación"),
                docente_seleccionado=proc_vars.get("docenteSeleccionado", user["id"]),
                porcentaje_asistencia=asistencia_val,
                informe_resultados=informe_texto,
                observaciones_dictado=proc_vars.get("observacionesDictado", ""),
            )

            sync_informe_to_db(
                process_instance_id=proc_id,
                informe_resultados=informe_texto,
                porcentaje_asistencia=asistencia_val,
                pdf_nombre=pdf_path.name,
                solicitud_id=sol_id,
            )

            variables_to_send = [
                {"name": "informeResultados", "type": "string", "value": informe_texto},
                {"name": "porcentajeAsistencia", "type": "integer", "value": asistencia_val},
                {"name": "informePdfNombre", "type": "string", "value": pdf_path.name},
            ]
            flash(f"Se generó el PDF del Informe de Resultados: {pdf_path.name}", "info")

        # 8. Enviar informe a empresa y Archivar expediente (EnviarInforme)
        elif task_key == "EnviarInforme":
            mensaje_envio = request.form.get("mensajeEnvioInforme", "").strip()
            sync_estado_solicitud(proc_id, "finalizado", solicitud_id=sol_id)
            variables_to_send = [
                {"name": "mensajeEnvioInforme", "type": "string", "value": mensaje_envio},
                {"name": "expedienteArchivado", "type": "boolean", "value": True},
                {"name": "resultadoProceso", "type": "string", "value": "finalizado"},
            ]

        ok, msg = complete_task(
            username=user["id"],
            password=password,
            task_id=task_id,
            variables=variables_to_send,
        )
        flash(msg, "success" if ok else "error")
        if ok:
            return redirect(url_for("bandeja"))

    template_name = TASK_TEMPLATES.get(task_key, "tasks/propuesta.html")
    return render_template(
        template_name,
        task=task,
        vars=proc_vars,
        docentes=DOCENTES_DISPONIBLES,
    )


@app.route("/pdfs/<path:filename>")
@login_required
def download_pdf(filename: str):
    return send_from_directory(PDF_OUTPUT_DIR, filename, as_attachment=False)


@app.errorhandler(404)
def page_not_found(_e):
    return redirect(url_for("index"))


if __name__ == "__main__":
    print(f"=== Iniciando Portal Web Interno en http://localhost:{PORT} ===")
    app.run(host="0.0.0.0", port=PORT, debug=True)
