import os
from flask import Flask, render_template, request, redirect, url_for, flash, send_from_directory, session

import config
from services import db_client, flowable_client

app = Flask(__name__)
app.secret_key = config.SECRET_KEY


def _sync_curso_estado(curso: dict) -> None:
    """Sincroniza el estado de la solicitud en institucion_db con el estado real en Flowable."""
    proc_id = curso.get("process_instance_id")
    if not proc_id:
        return
    estado_real = flowable_client.infer_estado_from_flowable(proc_id)
    if estado_real and estado_real != curso.get("estado"):
        db_client.update_solicitud_estado(proc_id, estado_real)
        curso["estado"] = estado_real

# Portal de inicio público
@app.route("/")
def portal():
    return render_template("portal.html")

# Formulario de solicitud — PUBLICO
@app.route("/solicitar-curso")
def index():
    return render_template(
        "index.html",
        empresa_nombre=session.get("empresa_nombre", ""),
        contacto_email=session.get("contacto_email", "")
    )

# Login de empresa (GET = muestra form, POST = autentica)
@app.route("/acceso-empresa", methods=["GET", "POST"])
def login_empresa():
    if request.method == "POST":
        empresa_nombre = request.form.get("empresa_nombre", "").strip()
        contacto_email = request.form.get("contacto_email", "").strip()

        if not empresa_nombre or not contacto_email:
            flash("Completá ambos campos para ingresar.", "warning")
            return render_template("login_empresa.html",
                                   prefill_nombre=empresa_nombre,
                                   prefill_email=contacto_email)

        empresa = db_client.get_empresa_by_nombre_and_email(empresa_nombre, contacto_email)
        if not empresa:
            flash("No encontramos una cuenta con esos datos. Verificá la razón social y el email, o realizá una primera solicitud.", "danger")
            return render_template("login_empresa.html",
                                   prefill_nombre=empresa_nombre,
                                   prefill_email=contacto_email)

        # Verificar si la empresa tiene acceso habilitado (al menos una propuesta aceptada -> en_preparacion o posterior)
        cursos_empresa = db_client.get_solicitudes_por_empresa(empresa["nombre"])
        for c in cursos_empresa:
            if c.get("empresa_id") == empresa["id"]:
                _sync_curso_estado(c)

        estados_habilitados = {"en_preparacion", "en_curso", "finalizado", "cancelado", "solicitado", "en_propuesta"}
        tiene_acceso = any(
            c.get("empresa_id") == empresa["id"] and c.get("estado") in estados_habilitados
            for c in cursos_empresa
        )

        if not tiene_acceso:
            flash(
                "Tu empresa ya está registrada, pero el acceso al portal se habilita automáticamente una vez que aceptes la propuesta comercial del curso.",
                "warning"
            )
            return render_template("login_empresa.html",
                                   prefill_nombre=empresa_nombre,
                                   prefill_email=contacto_email)

        session["empresa_id"] = empresa["id"]
        session["empresa_nombre"] = empresa["nombre"]
        session["contacto_nombre"] = empresa.get("contacto_nombre", "")
        session["contacto_email"] = empresa.get("contacto_email", contacto_email)
        flash(f"Bienvenida, {empresa['nombre']}. Sesión iniciada correctamente.", "success")
        next_page = request.args.get("next", "seguimiento")
        return redirect(url_for(next_page))

    return render_template("login_empresa.html")

# Logout de empresa
@app.route("/cerrar-sesion")
def logout_empresa():
    session.clear()
    flash("Sesión cerrada correctamente.", "success")
    return redirect(url_for("portal"))

# ruta para procesar el formulario de solicitud de capacitación
# registra o reutiliza la cuenta de la empresa en la BDD institucional
# registra la nueva solicitud en solicitudes_curso
# inicia la instancia del proceso de negocio en Flowable REST
# vincula el process_instance_id a la solicitud
# Procesa el formulario público de solicitud de capacitación (Sección 4.1.1)
@app.route("/solicitar", methods=["POST"])
def solicitar():
    empresa_nombre = request.form.get("empresa_nombre", "").strip()
    contacto_nombre = request.form.get("contacto_nombre", "").strip()
    contacto_email = request.form.get("contacto_email", "").strip()
    curso_nombre = request.form.get("curso_nombre", "").strip()
    curso_descripcion = request.form.get("curso_descripcion", "").strip()
    cantidad_participantes = request.form.get("cantidad_participantes", "1").strip()
    fechas_preferidas = request.form.get("fechas_preferidas", "").strip()

    # Validaciones obligatorias
    if not (empresa_nombre and contacto_nombre and contacto_email and curso_nombre and fechas_preferidas):
        flash("Por favor, complete todos los campos obligatorios marcados con (*).", "warning")
        return redirect(url_for("index"))

    try:
        cant_part = int(cantidad_participantes)
        if cant_part <= 0:
            cant_part = 1
    except ValueError:
        cant_part = 1

    # Base de datos: Registrar o reutilizar empresa (si ya contrató antes, reutiliza su ID)
    empresa_id = db_client.get_or_create_empresa(empresa_nombre, contacto_nombre, contacto_email)
    if not empresa_id:
        flash("Error al registrar los datos de la empresa en la base institucional. Verifique la conexión a PostgreSQL.", "danger")
        return redirect(url_for("index"))

    # Base de datos: Crear la fila de solicitud de curso
    solicitud_id = db_client.create_solicitud(
        empresa_id=empresa_id,
        nombre_curso=curso_nombre,
        descripcion=curso_descripcion,
        cantidad_participantes=cant_part,
        fechas_preferidas=fechas_preferidas,
    )
    if not solicitud_id:
        flash("Error al registrar la solicitud de curso en la base de datos.", "danger")
        return redirect(url_for("index"))

    # Flowable REST: Iniciar la instancia del proceso pasando las variables acordadas
    flowable_ok, flowable_msg, proc_instance_id = flowable_client.start_process_instance(
        solicitud_id=solicitud_id,
        empresa_nombre=empresa_nombre,
        empresa_contacto=f"{contacto_nombre} ({contacto_email})",
        curso_nombre=curso_nombre,
        curso_descripcion=curso_descripcion,
        cantidad_participantes=cant_part,
        fechas_preferidas=fechas_preferidas,
    )

    if flowable_ok and proc_instance_id:
        db_client.update_solicitud_process_instance(solicitud_id, proc_instance_id)
        flash("¡Solicitud enviada con éxito! El proceso fue iniciado correctamente en Flowable.", "success")
    else:
        flash(f"Solicitud registrada (# {solicitud_id}), pero Flowable no respondió: {flowable_msg}", "warning")

    return redirect(url_for("confirmacion", solicitud_id=solicitud_id))

# muestra el comprobante de registro de la solicitud y el id de seguimiento
@app.route("/solicitud/<int:solicitud_id>/confirmacion")
def confirmacion(solicitud_id: int):
    
    solicitud = db_client.get_solicitud_by_id(solicitud_id)
    if not solicitud:
        flash("No se encontró la solicitud especificada.", "danger")
        return redirect(url_for("index"))
    return render_template("confirmacion.html", solicitud=solicitud)

# Seguimiento exclusivo de los cursos de la empresa logueada
@app.route("/seguimiento")
def seguimiento():
    if not session.get("empresa_id"):
        flash("Iniciá sesión con tu cuenta de empresa para ver el seguimiento de tus cursos.", "warning")
        return redirect(url_for("login_empresa", next="seguimiento"))

    empresa_id = session["empresa_id"]
    empresa_nombre = session["empresa_nombre"]

    # Traemos todas las solicitudes de esa empresa y filtramos estrictamente por su empresa_id
    todas = db_client.get_solicitudes_por_empresa(empresa_nombre)
    cursos = [c for c in todas if c.get("empresa_id") == empresa_id]
    for c in cursos:
        _sync_curso_estado(c)

    return render_template("tracking.html", cursos=cursos, query=empresa_nombre, curso_detalle=None)

# Seguimiento de un curso en tiempo real (protegido para que solo lo vea la empresa dueña)
@app.route("/seguimiento/curso/<int:solicitud_id>")
def ver_curso(solicitud_id: int):
    if not session.get("empresa_id"):
        flash("Iniciá sesión para consultar el detalle de tu curso.", "warning")
        return redirect(url_for("login_empresa"))

    curso = db_client.get_solicitud_by_id(solicitud_id)
    if not curso:
        flash("No se encontró el curso solicitado.", "danger")
        return redirect(url_for("seguimiento"))

    # Validar que el curso pertenezca a la empresa logueada
    if curso.get("empresa_id") != session["empresa_id"]:
        flash("No tenés permisos para ver solicitudes de otra empresa.", "danger")
        return redirect(url_for("seguimiento"))

    _sync_curso_estado(curso)

    # Consultar documentos asociados (propuesta o informe)
    busqueda_asociada = db_client.get_solicitudes_por_empresa(str(solicitud_id))
    if busqueda_asociada:
        curso["propuesta_pdf_nombre"] = busqueda_asociada[0].get("propuesta_pdf_nombre")
        curso["ultima_propuesta_version"] = busqueda_asociada[0].get("ultima_propuesta_version")
        curso["informe_pdf_nombre"] = busqueda_asociada[0].get("informe_pdf_nombre")

    # Consultar actividades en tiempo real en Flowable
    actividades_activas = []
    proc_id = curso.get("process_instance_id")
    if proc_id:
        actividades_activas = flowable_client.get_active_tasks_and_activities(proc_id)

    return render_template(
        "tracking.html",
        cursos=None,
        query=curso.get("empresa_nombre"),
        curso_detalle=curso,
        actividades_activas=actividades_activas,
    )

# Permite a la empresa descargar la propuesta o informe final en PDF
@app.route("/descargar-pdf/<path:filename>")
def descargar_pdf(filename: str):
    if not session.get("empresa_id"):
        flash("Iniciá sesión para descargar documentos.", "warning")
        return redirect(url_for("login_empresa"))

    pdf_dir = config.PDF_DIR
    file_path = pdf_dir / filename
    if not file_path.exists():
        flash(f"El documento '{filename}' aún no ha sido generado o emitido por la administración.", "warning")
        return redirect(request.referrer or url_for("seguimiento"))

    return send_from_directory(str(pdf_dir), filename, as_attachment=True)

if __name__ == "__main__":
    print(f"=== Iniciando Portal Web de Empresas en http://localhost:{config.PORT} ===")
    app.run(host="0.0.0.0", port=config.PORT, debug=True)
