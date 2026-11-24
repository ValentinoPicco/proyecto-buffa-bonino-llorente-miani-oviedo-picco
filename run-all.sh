#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LOG_DIR="${ROOT_DIR}/.run-logs"
mkdir -p "$LOG_DIR"

PIDS=()

cleanup() {
    echo ""
    echo "Deteniendo aplicaciones locales..."
    for pid in "${PIDS[@]:-}"; do
        if kill -0 "$pid" 2>/dev/null; then
            kill "$pid" 2>/dev/null || true
        fi
    done
    wait 2>/dev/null || true
    echo "Aplicaciones detenidas. (Docker sigue corriendo; para frenarlo: cd docker && docker compose down)"
}

trap cleanup EXIT INT TERM

# 1. Verificar / levantar Docker (Flowable + PostgreSQL)
echo "[1/5] Verificando Docker (Flowable + PostgreSQL)..."
(cd "${ROOT_DIR}/docker" && docker compose up -d)

ensure_venv() {
    local dir="$1"
    if [ ! -x "${dir}/.venv/bin/python3" ]; then
        echo "  Creando entorno virtual e instalando dependencias en ${dir}..."
        python3 -m venv "${dir}/.venv"
        "${dir}/.venv/bin/pip" install -q -r "${dir}/requirements.txt"
    fi
}

# 2. Portal de Empresas (:5001)
echo "[2/5] Iniciando Portal de Empresas (http://localhost:5001)..."
ensure_venv "${ROOT_DIR}/web/empresa"
(
    cd "${ROOT_DIR}/web/empresa"
    exec .venv/bin/python3 app.py
) > "${LOG_DIR}/web-empresa.log" 2>&1 &
PIDS+=($!)

# 3. Portal Interno (:5000)
echo "[3/5] Iniciando Portal Interno (http://localhost:5000)..."
ensure_venv "${ROOT_DIR}/web/interno"
(
    cd "${ROOT_DIR}/web/interno"
    exec .venv/bin/python3 app.py
) > "${LOG_DIR}/web-interno.log" 2>&1 &
PIDS+=($!)

# 4. Compilar apps Java solo si faltan los JARs
if [ ! -f "${ROOT_DIR}/apps/desktop-java/target/desktop-java.jar" ] || [ ! -f "${ROOT_DIR}/apps/simulador-rest/target/simulador-rest.jar" ]; then
    echo "[4/5] Compilando aplicaciones Java..."
    "${ROOT_DIR}/apps/build.sh"
fi

# 5. Apps Java de escritorio
echo "[4/5] Iniciando App Materiales (desktop-java)..."
(
    cd "${ROOT_DIR}/apps"
    exec ./desktop-java/run.sh
) > "${LOG_DIR}/desktop-java.log" 2>&1 &
PIDS+=($!)

echo "[5/5] Iniciando Simulador REST (simulador-rest)..."
(
    cd "${ROOT_DIR}/apps"
    exec ./simulador-rest/run.sh
) > "${LOG_DIR}/simulador-rest.log" 2>&1 &
PIDS+=($!)

echo ""
echo "=============================================="
echo " Todo levantado:"
echo "  - Flowable UI:     http://localhost:8080/flowable-ui"
echo "  - Portal Empresas: http://localhost:5001"
echo "  - Portal Interno:  http://localhost:5000"
echo "  - pgAdmin 4:       http://localhost:5050"
echo "  - Logs en:         ${LOG_DIR}/"
echo "=============================================="
echo "Presioná Ctrl+C para cerrar las 2 webs y las 2 apps Java."

wait
