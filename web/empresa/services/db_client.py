from typing import Any
from config import DB_HOST, DB_PORT, DB_NAME, DB_USER, DB_PASSWORD

try:
    import psycopg2
    from psycopg2.extras import RealDictCursor
    HAS_PSYCOPG2 = True
except ImportError:
    HAS_PSYCOPG2 = False

# retorna una conexión a la BDD institucional
def get_connection():
    
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

# busca si la empresa existe por nombre o email de contacto, y la crea si no existe.
# Si existe, actualiza los datos de contacto y retorna la ID.
def get_or_create_empresa(nombre: str, contacto_nombre: str, contacto_email: str) -> int | None:
    
    conn = get_connection()
    if not conn:
        return None

    nombre_limpio = (nombre or "").strip()
    contacto_nombre = (contacto_nombre or "").strip()
    contacto_email = (contacto_email or "").strip().lower()

    try:
        with conn, conn.cursor(cursor_factory=RealDictCursor) as cur:
            # 1. Buscar si ya existe por nombre o email
            cur.execute(
                """
                SELECT id, nombre, contacto_email
                  FROM empresas
                 WHERE LOWER(TRIM(nombre)) = LOWER(%s)
                    OR (LOWER(TRIM(contacto_email)) = %s AND %s != '')
                 LIMIT 1
                """,
                (nombre_limpio, contacto_email, contacto_email),
            )
            existente = cur.fetchone()

            if existente:
                empresa_id = existente["id"]
                # Actualizar datos de contacto si cambiaron
                cur.execute(
                    """
                    UPDATE empresas
                       SET contacto_nombre = COALESCE(NULLIF(%s, ''), contacto_nombre),
                           contacto_email = COALESCE(NULLIF(%s, ''), contacto_email)
                     WHERE id = %s
                    """,
                    (contacto_nombre, contacto_email, empresa_id),
                )
                return empresa_id

            # 2. Si no existe, crear nueva empresa
            cur.execute(
                """
                INSERT INTO empresas (nombre, contacto_nombre, contacto_email)
                VALUES (%s, %s, %s)
                RETURNING id
                """,
                (nombre_limpio, contacto_nombre, contacto_email),
            )
            nuevo = cur.fetchone()
            return nuevo["id"] if nuevo else None
    except Exception as exc:
        print(f"[db_client] Error en get_or_create_empresa: {exc}")
        return None
    finally:
        conn.close()

# Inserta una solicitud de curso en solicitudes_curso y retorna el ID.
def create_solicitud(
    empresa_id: int,
    nombre_curso: str,
    descripcion: str,
    cantidad_participantes: int,
    fechas_preferidas: str,
) -> int | None:
    
    conn = get_connection()
    if not conn:
        return None

    try:
        with conn, conn.cursor(cursor_factory=RealDictCursor) as cur:
            cur.execute(
                """
                INSERT INTO solicitudes_curso (
                    empresa_id,
                    nombre,
                    descripcion,
                    cantidad_participantes,
                    fechas_preferidas,
                    estado
                ) VALUES (%s, %s, %s, %s, %s, 'solicitado')
                RETURNING id
                """,
                (
                    empresa_id,
                    (nombre_curso or "").strip(),
                    (descripcion or "").strip(),
                    max(1, int(cantidad_participantes or 1)),
                    (fechas_preferidas or "").strip(),
                ),
            )
            fila = cur.fetchone()
            return fila["id"] if fila else None
    except Exception as exc:
        print(f"[db_client] Error en create_solicitud: {exc}")
        return None
    finally:
        conn.close()

# Actualiza el process_instance_id de Flowable en la solicitud correspondiente.
def update_solicitud_process_instance(solicitud_id: int, process_instance_id: str) -> bool:

    conn = get_connection()
    if not conn:
        return False

    try:
        with conn, conn.cursor() as cur:
            cur.execute(
                """
                UPDATE solicitudes_curso
                   SET process_instance_id = %s,
                       updated_at = CURRENT_TIMESTAMP
                 WHERE id = %s
                """,
                (process_instance_id, solicitud_id),
            )
        return True
    except Exception as exc:
        print(f"[db_client] Error en update_solicitud_process_instance: {exc}")
        return False
    finally:
        conn.close()

# Actualiza el estado de una solicitud (ej. 'en_propuesta', 'en_preparacion', 'finalizado', etc.).
    
def update_solicitud_estado(process_instance_id: str, nuevo_estado: str) -> bool:
    
    conn = get_connection()
    if not conn:
        return False

    try:
        with conn, conn.cursor() as cur:
            cur.execute(
                """
                UPDATE solicitudes_curso
                   SET estado = %s,
                       updated_at = CURRENT_TIMESTAMP
                 WHERE process_instance_id = %s
                """,
                (nuevo_estado, process_instance_id),
            )
        return True
    except Exception as exc:
        print(f"[db_client] Error en update_solicitud_estado: {exc}")
        return False
    finally:
        conn.close()

# Obtiene la solicitud por su ID junto con la información de la empresa.
def get_solicitud_by_id(solicitud_id: int) -> dict[str, Any] | None:
    
    conn = get_connection()
    if not conn:
        return None

    try:
        with conn, conn.cursor(cursor_factory=RealDictCursor) as cur:
            cur.execute(
                """
                SELECT s.id,
                       s.process_instance_id,
                       s.nombre AS curso_nombre,
                       s.descripcion,
                       s.cantidad_participantes,
                       s.fechas_preferidas,
                       s.estado,
                       s.created_at,
                       s.updated_at,
                       e.id AS empresa_id,
                       e.nombre AS empresa_nombre,
                       e.contacto_nombre,
                       e.contacto_email
                  FROM solicitudes_curso s
                  JOIN empresas e ON e.id = s.empresa_id
                 WHERE s.id = %s
                """,
                (solicitud_id,),
            )
            return cur.fetchone()
    except Exception as exc:
        print(f"[db_client] Error en get_solicitud_by_id: {exc}")
        return None
    finally:
        conn.close()

# busca las solicitudes y cursos de una empresa. Incluye la última versión de propuesta y si hay informe disponible.
def get_solicitudes_por_empresa(query: str) -> list[dict[str, Any]]:
    
    conn = get_connection()
    if not conn:
        return []

    busqueda = (query or "").strip()
    if not busqueda:
        return []

    try:
        with conn, conn.cursor(cursor_factory=RealDictCursor) as cur:
            # Buscar por ID numérico exacto o por texto en nombre/email
            cur.execute(
                """
                SELECT s.id AS solicitud_id,
                       s.process_instance_id,
                       s.nombre AS curso_nombre,
                       s.descripcion,
                       s.cantidad_participantes,
                       s.fechas_preferidas,
                       s.estado,
                       s.created_at,
                       e.id AS empresa_id,
                       e.nombre AS empresa_nombre,
                       e.contacto_nombre,
                       e.contacto_email,
                       (SELECT p.version
                          FROM propuestas p
                         WHERE p.solicitud_id = s.id
                         ORDER BY p.version DESC LIMIT 1) AS ultima_propuesta_version,
                       (SELECT p.pdf_nombre
                          FROM propuestas p
                         WHERE p.solicitud_id = s.id
                         ORDER BY p.version DESC LIMIT 1) AS propuesta_pdf_nombre,
                       (SELECT ir.pdf_nombre
                          FROM informes_resultados ir
                         WHERE ir.solicitud_id = s.id
                         ORDER BY ir.id DESC LIMIT 1) AS informe_pdf_nombre
                  FROM solicitudes_curso s
                  JOIN empresas e ON e.id = s.empresa_id
                 WHERE LOWER(e.nombre) LIKE LOWER(%s)
                    OR LOWER(e.contacto_email) = LOWER(%s)
                    OR CAST(s.id AS TEXT) = %s
                    OR s.process_instance_id = %s
                 ORDER BY s.created_at DESC
                """,
                (f"%{busqueda}%", busqueda, busqueda, busqueda),
            )
            return cur.fetchall()
    except Exception as exc:
        print(f"[db_client] Error en get_solicitudes_por_empresa: {exc}")
        return []
    finally:
        conn.close()

# Busca una empresa por razón social y email de contacto para el login de empresa.
def get_empresa_by_nombre_and_email(nombre: str, email: str) -> dict[str, Any] | None:

    conn = get_connection()
    if not conn:
        return None

    nombre_limpio = (nombre or "").strip()
    email_limpio = (email or "").strip().lower()

    try:
        with conn, conn.cursor(cursor_factory=RealDictCursor) as cur:
            cur.execute(
                """
                SELECT id, nombre, contacto_nombre, contacto_email
                  FROM empresas
                 WHERE LOWER(TRIM(nombre)) = LOWER(%s)
                   AND LOWER(TRIM(contacto_email)) = %s
                 LIMIT 1
                """,
                (nombre_limpio, email_limpio),
            )
            return cur.fetchone()
    except Exception as exc:
        print(f"[db_client] Error en get_empresa_by_nombre_and_email: {exc}")
        return None
    finally:
        conn.close()

# Obtiene exclusivamente las solicitudes de una empresa por su ID exacto.
def get_solicitudes_by_empresa_id(empresa_id: int) -> list[dict[str, Any]]:
    conn = get_connection()
    if not conn:
        return []

    try:
        with conn, conn.cursor(cursor_factory=RealDictCursor) as cur:
            cur.execute(
                """
                SELECT s.id AS solicitud_id,
                       s.process_instance_id,
                       s.nombre AS curso_nombre,
                       s.descripcion,
                       s.cantidad_participantes,
                       s.fechas_preferidas,
                       s.estado,
                       s.created_at,
                       e.id AS empresa_id,
                       e.nombre AS empresa_nombre,
                       e.contacto_nombre,
                       e.contacto_email,
                       (SELECT p.version
                          FROM propuestas p
                         WHERE p.solicitud_id = s.id
                         ORDER BY p.version DESC LIMIT 1) AS ultima_propuesta_version,
                       (SELECT p.pdf_nombre
                          FROM propuestas p
                         WHERE p.solicitud_id = s.id
                         ORDER BY p.version DESC LIMIT 1) AS propuesta_pdf_nombre,
                       (SELECT ir.pdf_nombre
                          FROM informes_resultados ir
                         WHERE ir.solicitud_id = s.id
                         ORDER BY ir.id DESC LIMIT 1) AS informe_pdf_nombre
                  FROM solicitudes_curso s
                  JOIN empresas e ON e.id = s.empresa_id
                 WHERE s.empresa_id = %s
                 ORDER BY s.created_at DESC
                """,
                (empresa_id,),
            )
            return cur.fetchall()
    except Exception as exc:
        print(f"[db_client] Error en get_solicitudes_by_empresa_id: {exc}")
        return []
    finally:
        conn.close()