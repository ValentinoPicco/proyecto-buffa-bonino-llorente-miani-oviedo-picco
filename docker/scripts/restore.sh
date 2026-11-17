#!/bin/bash
set -e

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

# Si no se pasó argumento, mostrar lista de backups disponibles y ayuda
if [ -z "$1" ]; then
    echo "=== Restauración de Bases de Datos Flowable ==="
    echo "Uso: $0 <nombre_o_ruta_del_archivo> [nombre_bd]"
    echo ""
    echo "Archivos disponibles en backups/:"
    ls -1 "${DIR}/backups" 2>/dev/null || true
    echo ""
    echo "Ejemplos:"
    echo "  $0 flowable_YYYYMMDD_HHMMSS.dump"
    echo "  $0 flowable_YYYYMMDD_HHMMSS.sql"
    echo "  $0 backups/institucion_YYYYMMDD_HHMMSS.dump institucion_db"
    exit 1
fi

INPUT="$1"
DB="${2:-flowable}"

# Resolver la ruta del archivo si se pasó solo el nombre
if [ -f "$INPUT" ]; then
    FILE="$INPUT"
elif [ -f "${DIR}/backups/$INPUT" ]; then
    FILE="${DIR}/backups/$INPUT"
elif [ -f "backups/$INPUT" ]; then
    FILE="backups/$INPUT"
else
    echo "Error: No se encontró el archivo '$INPUT' ni en '${DIR}/backups/$INPUT'"
    exit 1
fi

echo "=== Restaurando archivo: $(basename "$FILE") en la base de datos '$DB' ==="

if [[ "$FILE" == *.sql ]]; then
    cat "$FILE" | docker exec -i flowable-postgres psql -U flowable -d "$DB"
elif [[ "$FILE" == *.dump ]]; then
    docker cp "$FILE" flowable-postgres:/tmp/restore.dump
    docker exec flowable-postgres pg_restore -U flowable -d "$DB" --clean --if-exists -v /tmp/restore.dump
    docker exec flowable-postgres rm /tmp/restore.dump
else
    echo "Formato no reconocido. Se esperaba un archivo .dump o .sql"
    exit 1
fi

echo "=== Restauración finalizada con éxito ==="
echo "Reiniciando contenedor de Flowable para refrescar caché..."
docker compose restart flowable 2>/dev/null || docker restart flowable-persistente 2>/dev/null || true
echo "¡Listo! Base de datos sincronizada y Flowable activo."
