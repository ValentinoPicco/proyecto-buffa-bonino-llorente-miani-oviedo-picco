#!/bin/bash
set -e

echo "Creando esquema de '${INSTITUCION_DB}'..."
psql -v ON_ERROR_STOP=1 \
    --username "$POSTGRES_USER" \
    --dbname "$INSTITUCION_DB" \
    --file /opt/project-db/institucion_schema.sql
echo "Esquema de '${INSTITUCION_DB}' listo."
