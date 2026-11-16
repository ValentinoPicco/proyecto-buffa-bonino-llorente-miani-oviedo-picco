#!/bin/bash
set -e

echo "Iniciando script de creación de base de datos adicional: '${INSTITUCION_DB}'..."
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE DATABASE ${INSTITUCION_DB};
    GRANT ALL PRIVILEGES ON DATABASE ${INSTITUCION_DB} TO ${POSTGRES_USER};
EOSQL
echo "Base de datos '${INSTITUCION_DB}' creada correctamente."
