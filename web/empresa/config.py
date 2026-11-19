import os
from pathlib import Path

BASE_DIR = Path(__file__).resolve().parent

# Puerto de la app externa, la interna corre en el 5000
PORT = int(os.environ.get("PORT", "5001"))

# Configuración de sesión Flask
SECRET_KEY = os.environ.get("FLASK_SECRET_KEY", "dev-secret-key-portal-empresa-unrc")

# Endpoints de Flowable REST API
FLOWABLE_BASE_URL = os.environ.get("FLOWABLE_BASE_URL", "http://localhost:8080/flowable-ui")
FLOWABLE_PROCESS_API = f"{FLOWABLE_BASE_URL}/process-api"

# Credenciales de servicio para invocar la API REST de Flowable al iniciar procesos o consultar tareas
FLOWABLE_USER = os.environ.get("FLOWABLE_USER", "admin")
FLOWABLE_PASSWORD = os.environ.get("FLOWABLE_PASSWORD", "test")

# Identificadores BPMN
PROCESS_DEFINITION_KEY = "Process_Curso"
START_MESSAGE_NAME = "solicitudMsg"

# Conexión a Base de Datos Institucional
DB_HOST = os.environ.get("DB_HOST", "localhost")
DB_PORT = int(os.environ.get("DB_PORT", "5432"))
DB_NAME = os.environ.get("DB_NAME", "institucion_db")
DB_USER = os.environ.get("DB_USER", "flowable")
DB_PASSWORD = os.environ.get("DB_PASSWORD", "flow10")

# Carpeta de PDFs generados por el portal interno
PDF_DIR = BASE_DIR.parent / "interno" / "generated_pdfs"
