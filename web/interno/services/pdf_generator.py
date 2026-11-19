from datetime import datetime
from pathlib import Path
from typing import Any

from config import PDF_OUTPUT_DIR

try:
    from fpdf import FPDF
    HAS_FPDF = True
except ImportError:
    HAS_FPDF = False


def _sanitize_latin1(text: Any) -> str:
    """Asegura que el texto sea compatible con las fuentes estándar de FPDF."""
    if text is None:
        return "-"
    return str(text).encode("latin-1", errors="replace").decode("latin-1")


def generate_propuesta_pdf(
    process_instance_id: str,
    version: int,
    empresa_nombre: str,
    empresa_contacto: str,
    curso_nombre: str,
    programa: str,
    presupuesto: float | str,
    fechas_posibles: str,
    observaciones_previas: str = "",
) -> Path:
    """
    Genera el PDF de la Propuesta de Capacitación (Versión inicial o Nueva versión revisada).
    Devuelve la ruta del archivo generado en generated_pdfs/.
    """
    safe_proc_id = "".join(c if c.isalnum() or c in ("-", "_") else "_" for c in str(process_instance_id))
    filename = f"propuesta_{safe_proc_id}_v{version}.pdf"
    output_path = PDF_OUTPUT_DIR / filename

    fecha_emision = datetime.now().strftime("%d/%m/%Y %H:%M")

    if HAS_FPDF:
        pdf = FPDF()
        pdf.set_auto_page_break(auto=True, margin=15)
        pdf.add_page()

        # Encabezado Institucional
        pdf.set_font("Helvetica", "B", 16)
        pdf.cell(0, 10, _sanitize_latin1("INSTITUCIÓN DE CAPACITACIÓN CORPORATIVA"), new_x="LMARGIN", new_y="NEXT", align="C")
        pdf.set_font("Helvetica", "B", 13)
        titulo = f"PROPUESTA DE CAPACITACIÓN - VERSIÓN {version}"
        pdf.cell(0, 8, _sanitize_latin1(titulo), new_x="LMARGIN", new_y="NEXT", align="C")
        pdf.ln(4)

        pdf.set_font("Helvetica", "", 10)
        pdf.cell(0, 6, _sanitize_latin1(f"Fecha de emisión: {fecha_emision} | Expediente Flowable: {process_instance_id}"), new_x="LMARGIN", new_y="NEXT")
        pdf.ln(4)

        # Datos de la Empresa y Curso
        pdf.set_font("Helvetica", "B", 11)
        pdf.cell(0, 8, _sanitize_latin1("1. Datos de la Solicitud"), new_x="LMARGIN", new_y="NEXT")
        pdf.set_font("Helvetica", "", 11)
        pdf.multi_cell(0, 6, _sanitize_latin1(f"Empresa Solicitante: {empresa_nombre}\nContacto: {empresa_contacto}\nCurso Solicitado: {curso_nombre}"))
        pdf.ln(3)

        # Programa Propuesto
        pdf.set_font("Helvetica", "B", 11)
        pdf.cell(0, 8, _sanitize_latin1("2. Programa de Contenidos Propuesto"), new_x="LMARGIN", new_y="NEXT")
        pdf.set_font("Helvetica", "", 11)
        pdf.multi_cell(0, 6, _sanitize_latin1(programa))
        pdf.ln(3)

        # Presupuesto y Fechas
        pdf.set_font("Helvetica", "B", 11)
        pdf.cell(0, 8, _sanitize_latin1("3. Presupuesto y Fechas Posibles"), new_x="LMARGIN", new_y="NEXT")
        pdf.set_font("Helvetica", "", 11)
        pdf.multi_cell(0, 6, _sanitize_latin1(f"Presupuesto Total: $ {presupuesto}\nFechas Disponibles: {fechas_posibles}"))
        pdf.ln(3)

        if observaciones_previas:
            pdf.set_font("Helvetica", "B", 11)
            pdf.cell(0, 8, _sanitize_latin1("4. Ajustes Realizados sobre Observaciones de la Empresa"), new_x="LMARGIN", new_y="NEXT")
            pdf.set_font("Helvetica", "", 10)
            pdf.multi_cell(0, 6, _sanitize_latin1(observaciones_previas))

        pdf.output(str(output_path))
    else:
        # Fallback PDF mínimo estándar si fpdf2 aún no fue instalado en el entorno virtual
        content = (
            f"PROPUESTA DE CAPACITACION v{version} ({fecha_emision}) - "
            f"Empresa: {empresa_nombre} | Curso: {curso_nombre} | "
            f"Presupuesto: ${presupuesto} | Fechas: {fechas_posibles}"
        )
        _write_minimal_pdf(output_path, content)

    return output_path


def generate_informe_pdf(
    process_instance_id: str,
    empresa_nombre: str,
    curso_nombre: str,
    docente_seleccionado: str,
    porcentaje_asistencia: int | str,
    informe_resultados: str,
    observaciones_dictado: str = "",
) -> Path:
    """
    Genera el PDF del Informe de Resultados Final del Curso.
    Devuelve la ruta del archivo generado en generated_pdfs/.
    """
    safe_proc_id = "".join(c if c.isalnum() or c in ("-", "_") else "_" for c in str(process_instance_id))
    filename = f"informe_{safe_proc_id}.pdf"
    output_path = PDF_OUTPUT_DIR / filename

    fecha_emision = datetime.now().strftime("%d/%m/%Y %H:%M")

    if HAS_FPDF:
        pdf = FPDF()
        pdf.set_auto_page_break(auto=True, margin=15)
        pdf.add_page()

        pdf.set_font("Helvetica", "B", 16)
        pdf.cell(0, 10, _sanitize_latin1("INSTITUCIÓN DE CAPACITACIÓN CORPORATIVA"), new_x="LMARGIN", new_y="NEXT", align="C")
        pdf.set_font("Helvetica", "B", 13)
        pdf.cell(0, 8, _sanitize_latin1("INFORME FINAL DE RESULTADOS DEL CURSO"), new_x="LMARGIN", new_y="NEXT", align="C")
        pdf.ln(4)

        pdf.set_font("Helvetica", "", 10)
        pdf.cell(0, 6, _sanitize_latin1(f"Fecha de emisión: {fecha_emision} | Expediente Flowable: {process_instance_id}"), new_x="LMARGIN", new_y="NEXT")
        pdf.ln(4)

        pdf.set_font("Helvetica", "B", 11)
        pdf.cell(0, 8, _sanitize_latin1("1. Información General del Curso"), new_x="LMARGIN", new_y="NEXT")
        pdf.set_font("Helvetica", "", 11)
        pdf.multi_cell(
            0,
            6,
            _sanitize_latin1(
                f"Empresa: {empresa_nombre}\n"
                f"Curso Desarrollado: {curso_nombre}\n"
                f"Docente a Cargo: {docente_seleccionado}\n"
                f"Asistencia Promedio Registrada: {porcentaje_asistencia}%"
            ),
        )
        pdf.ln(3)

        if observaciones_dictado:
            pdf.set_font("Helvetica", "B", 11)
            pdf.cell(0, 8, _sanitize_latin1("2. Observaciones del Dictado"), new_x="LMARGIN", new_y="NEXT")
            pdf.set_font("Helvetica", "", 11)
            pdf.multi_cell(0, 6, _sanitize_latin1(observaciones_dictado))
            pdf.ln(3)

        pdf.set_font("Helvetica", "B", 11)
        pdf.cell(0, 8, _sanitize_latin1("3. Evaluación y Resultados Alcanzados"), new_x="LMARGIN", new_y="NEXT")
        pdf.set_font("Helvetica", "", 11)
        pdf.multi_cell(0, 6, _sanitize_latin1(informe_resultados))

        pdf.output(str(output_path))
    else:
        content = (
            f"INFORME DE RESULTADOS ({fecha_emision}) - "
            f"Empresa: {empresa_nombre} | Curso: {curso_nombre} | "
            f"Docente: {docente_seleccionado} | Asistencia: {porcentaje_asistencia}%"
        )
        _write_minimal_pdf(output_path, content)

    return output_path


def _write_minimal_pdf(output_path: Path, text: str) -> None:
    """Escribe un archivo PDF 1.4 válido sin dependencias externas como respaldo."""
    safe_text = _sanitize_latin1(text).replace("(", "\\(").replace(")", "\\)")
    stream = f"BT /F1 11 Tf 40 750 Td ({safe_text[:110]}) Tj ET"
    pdf_bytes = (
        "%PDF-1.4\n"
        "1 0 obj << /Type /Catalog /Pages 2 0 R >> endobj\n"
        "2 0 obj << /Type /Pages /Kids [3 0 R] /Count 1 >> endobj\n"
        "3 0 obj << /Type /Page /Parent 2 0 R /MediaBox [0 0 612 792] "
        "/Contents 4 0 R /Resources << /Font << /F1 5 0 R >> >> >> endobj\n"
        f"4 0 obj << /Length {len(stream)} >> stream\n{stream}\nendstream endobj\n"
        "5 0 obj << /Type /Font /Subtype /Type1 /BaseFont /Helvetica >> endobj\n"
        "xref\n0 6\n0000000000 65535 f \n"
        "trailer << /Size 6 /Root 1 0 R >>\nstartxref\n0\n%%EOF\n"
    ).encode("latin-1")
    output_path.write_bytes(pdf_bytes)
