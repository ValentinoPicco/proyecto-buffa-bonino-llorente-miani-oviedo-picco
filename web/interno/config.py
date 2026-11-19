import os
from pathlib import Path

BASE_DIR = Path(__file__).resolve().parent
PDF_OUTPUT_DIR = BASE_DIR / "generated_pdfs"
PDF_OUTPUT_DIR.mkdir(parents=True, exist_ok=True)

# Configuración de sesión Flask
SECRET_KEY = os.environ.get("FLASK_SECRET_KEY", "dev-secret-key-portal-interno-unrc")

# Endpoints de Flowable UI 6.8.0 (según docker/README.md)
FLOWABLE_BASE_URL = os.environ.get("FLOWABLE_BASE_URL", "http://localhost:8080/flowable-ui")
FLOWABLE_PROCESS_API = f"{FLOWABLE_BASE_URL}/process-api"
FLOWABLE_IDM_API = f"{FLOWABLE_BASE_URL}/idm-api"

# Configuración de Base de Datos Institucional (PostgreSQL en docker-compose.yml)
DB_HOST = os.environ.get("DB_HOST", "localhost")
DB_PORT = int(os.environ.get("DB_PORT", "5432"))
DB_NAME = os.environ.get("DB_NAME", "institucion_db")
DB_USER = os.environ.get("DB_USER", "flowable")
DB_PASSWORD = os.environ.get("DB_PASSWORD", "flow10")
