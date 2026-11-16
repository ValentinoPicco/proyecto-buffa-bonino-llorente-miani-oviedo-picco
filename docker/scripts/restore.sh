#!/bin/bash
set -e

if [ -z "$1" ]; then
    echo "Uso: $0 <archivo_backup.sql o archivo_backup.dump> [nombre_bd]"
    echo "Ejemplo: $0 ../backups/full_backup_20261116.sql"
    echo "Ejemplo: $0 ../backups/flowable_20261116.dump flowable"
    exit 1
fi

FILE="$1"
DB="${2:-flowable}"

if [[ "$FILE" == *.sql ]]; then
    echo "Restaurando script SQL en PostgreSQL..."
    cat "$FILE" | docker exec -i flowable-postgres psql -U flowable
elif [[ "$FILE" == *.dump ]]; then
    echo "Restaurando volcado custom en base de datos '${DB}'..."
    docker cp "$FILE" flowable-postgres:/tmp/restore.dump
    docker exec flowable-postgres pg_restore -U flowable -d "$DB" --clean --if-exists -v /tmp/restore.dump
    docker exec flowable-postgres rm /tmp/restore.dump
else
    echo "Formato no reconocido. Se esperaba .sql o .dump"
    exit 1
fi

echo "=== Restauración finalizada con éxito ==="
