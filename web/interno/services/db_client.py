from typing import Any
from config import DB_HOST, DB_PORT, DB_NAME, DB_USER, DB_PASSWORD

try:
    import psycopg2
    from psycopg2.extras import RealDictCursor
    HAS_PSYCOPG2 = True
except ImportError:
    HAS_PSYCOPG2 = False


def get_connection():
    #Retorna una conexión a la base de datos institucional (institucion_db).
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


def sync_propuesta_to_db(process_instance_id: str, programa: str, presupuesto: float, fechas_posibles: str,) -> bool:
    #Sincroniza los datos de la propuesta en la tabla cursos de institucion_db.

    conn = get_connection()
    if not conn:
        return False
    try:
        with conn, conn.cursor() as cur:
            cur.execute(
                """
                UPDATE cursos
                   SET programa = %s,
                       presupuesto = %s,
                       fechas = %s
                 WHERE process_instance_id = %s
                """,
                (programa, presupuesto, fechas_posibles, process_instance_id),
            )
        return True
    except Exception:
        return False
    finally:
        conn.close()


def sync_informe_to_db(process_instance_id: str, informe_resultados: str) -> bool:
    #Sincroniza el informe de resultados en la tabla cursos de institucion_db.
    conn = get_connection()
    if not conn:
        return False
    try:
        with conn, conn.cursor() as cur:
            cur.execute(
                """
                UPDATE cursos
                   SET informe_resultados = %s
                 WHERE process_instance_id = %s
                """,
                (informe_resultados, process_instance_id),
            )
        return True
    except Exception:
        return False
    finally:
        conn.close()
