#!/bin/bash
set -e

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
BACKUP_DIR="${DIR}/backups"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

mkdir -p "${BACKUP_DIR}"

echo "=== Generando Backup de Bases de Datos PostgreSQL ==="

# 1. Backup de Flowable (Dump binario - optimizado para pg_restore --clean)
echo "1. Exportando base de datos Flowable (.dump)..."
docker exec flowable-postgres pg_dump -U flowable -d flowable -F c -b -v -f /tmp/flowable_${TIMESTAMP}.dump
docker cp flowable-postgres:/tmp/flowable_${TIMESTAMP}.dump "${BACKUP_DIR}/flowable_${TIMESTAMP}.dump"
docker exec flowable-postgres rm /tmp/flowable_${TIMESTAMP}.dump

# 2. Backup de la Institución (Dump binario)
echo "2. Exportando base de datos Institución (.dump)..."
docker exec flowable-postgres pg_dump -U flowable -d institucion_db -F c -b -v -f /tmp/institucion_${TIMESTAMP}.dump
docker cp flowable-postgres:/tmp/institucion_${TIMESTAMP}.dump "${BACKUP_DIR}/institucion_${TIMESTAMP}.dump"
docker exec flowable-postgres rm /tmp/institucion_${TIMESTAMP}.dump

# 3. Backup en formato SQL con DROP TABLE IF EXISTS predeterminado (evita errores de duplicados)
echo "3. Exportando copia SQL limpia (.sql)..."
docker exec flowable-postgres pg_dump -U flowable -d flowable --clean --if-exists > "${BACKUP_DIR}/full_backup_${TIMESTAMP}.sql"

echo "=== Backup completado exitosamente en: ${BACKUP_DIR} ==="
ls -lh "${BACKUP_DIR}"/*${TIMESTAMP}*
