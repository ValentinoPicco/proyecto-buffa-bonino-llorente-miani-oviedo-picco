from typing import Any
from config import DB_HOST, DB_PORT, DB_NAME, DB_USER, DB_PASSWORD

try:
    import psycopg2
    from psycopg2.extras import RealDictCursor
    HAS_PSYCOPG2 = True
except ImportError:
    HAS_PSYCOPG2 = False


def get_connection():
    """Retorna una conexión a la base de datos institucional (institucion_db)."""
    if not HAS_PSYCOPG2:
        return None
    try:
        return psycopg2.connect(
            host=DB_HOST,
            port=DB_PORT,
            dbname=DB_NAME,
            user=DB_USER,
            password=DB_PASSWORD,
            connect_timeout=3,
        )
    except Exception:
        return None


def _resolve_solicitud_id(cur, process_instance_id: str, solicitud_id: int | None = None) -> int | None:
    if solicitud_id:
        try:
            return int(solicitud_id)
        except (ValueError, TypeError):
            pass
    cur.execute(
        "SELECT id FROM solicitudes_curso WHERE process_instance_id = %s LIMIT 1",
        (str(process_instance_id),),
    )
    row = cur.fetchone()
    return row[0] if row else None


def sync_propuesta_to_db(
    process_instance_id: str,
    programa: str,
    presupuesto: float,
    fechas_posibles: str,
    version: int = 1,
    pdf_nombre: str | None = None,
    observaciones_empresa: str | None = None,
    solicitud_id: int | None = None,
) -> bool:
    """
    Registra la propuesta en la tabla 'propuestas' y actualiza el estado en 'solicitudes_curso'
    según el esquema real de db/institucion_schema.sql.
    """
    conn = get_connection()
    if not conn:
        return False
    try:
        with conn, conn.cursor() as cur:
            sol_id = _resolve_solicitud_id(cur, process_instance_id, solicitud_id)
            if not sol_id:
                return False

            cur.execute(
                """
                INSERT INTO propuestas (
                    solicitud_id,
                    version,
                    programa,
                    presupuesto,
                    fechas_posibles,
                    pdf_nombre,
                    observaciones_empresa
                ) VALUES (%s, %s, %s, %s, %s, %s, %s)
                ON CONFLICT (solicitud_id, version)
                DO UPDATE SET
                    programa = EXCLUDED.programa,
                    presupuesto = EXCLUDED.presupuesto,
                    fechas_posibles = EXCLUDED.fechas_posibles,
                    pdf_nombre = EXCLUDED.pdf_nombre,
                    observaciones_empresa = EXCLUDED.observaciones_empresa
                """,
                (
                    sol_id,
                    int(version),
                    programa,
                    presupuesto,
                    fechas_posibles,
                    pdf_nombre,
                    observaciones_empresa,
                ),
            )
            cur.execute(
                """
                UPDATE solicitudes_curso
                   SET estado = 'en_propuesta',
                       updated_at = CURRENT_TIMESTAMP
                 WHERE id = %s
                """,
                (sol_id,),
            )
        return True
    except Exception:
        return False
    finally:
        conn.close()


def sync_informe_to_db(
    process_instance_id: str,
    informe_resultados: str,
    porcentaje_asistencia: int = 100,
    pdf_nombre: str | None = None,
    solicitud_id: int | None = None,
) -> bool:
    """
    Registra el informe de resultados en la tabla 'informes_resultados' de institucion_db.
    """
    conn = get_connection()
    if not conn:
        return False
    try:
        with conn, conn.cursor() as cur:
            sol_id = _resolve_solicitud_id(cur, process_instance_id, solicitud_id)
            if not sol_id:
                return False

            cur.execute(
                """
                INSERT INTO informes_resultados (
                    solicitud_id,
                    resultados,
                    porcentaje_asistencia,
                    pdf_nombre
                ) VALUES (%s, %s, %s, %s)
                """,
                (sol_id, informe_resultados, porcentaje_asistencia, pdf_nombre),
            )
        return True
    except Exception:
        return False
    finally:
        conn.close()
