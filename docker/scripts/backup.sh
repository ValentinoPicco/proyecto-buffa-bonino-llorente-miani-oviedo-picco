#!/bin/bash
set -e

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
BACKUP_DIR="${DIR}/backups"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

mkdir -p "${BACKUP_DIR}"

echo "=== Generando Backup de Bases de Datos PostgreSQL ==="

# Backup de la BD de Flowable
echo "1. Exportando base de datos Flowable..."
docker exec flowable-postgres pg_dump -U flowable -d flowable -F c -b -v -f /tmp/flowable_${TIMESTAMP}.dump
docker cp flowable-postgres:/tmp/flowable_${TIMESTAMP}.dump "${BACKUP_DIR}/flowable_${TIMESTAMP}.dump"
docker exec flowable-postgres rm /tmp/flowable_${TIMESTAMP}.dump

# Backup de la BD de la Institución
echo "2. Exportando base de datos Institución..."
docker exec flowable-postgres pg_dump -U flowable -d institucion_db -F c -b -v -f /tmp/institucion_${TIMESTAMP}.dump
docker cp flowable-postgres:/tmp/institucion_${TIMESTAMP}.dump "${BACKUP_DIR}/institucion_${TIMESTAMP}.dump"
docker exec flowable-postgres rm /tmp/institucion_${TIMESTAMP}.dump

# Backup en formato SQL plano para fácil lectura
echo "3. Exportando copia SQL consolidada..."
docker exec flowable-postgres pg_dumpall -U flowable > "${BACKUP_DIR}/full_backup_${TIMESTAMP}.sql"

echo "=== Backup completado exitosamente en: ${BACKUP_DIR} ==="
ls -lh "${BACKUP_DIR}"/*${TIMESTAMP}*
