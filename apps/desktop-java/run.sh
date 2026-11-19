#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"

if [ ! -f target/desktop-java.jar ]; then
    echo "No se encontro target/desktop-java.jar. Ejecute primero ../build.sh" >&2
    exit 1
fi

JAVA_BIN=java
if [ -x /usr/lib/jvm/java-17-openjdk-amd64/bin/java ]; then
    JAVA_BIN=/usr/lib/jvm/java-17-openjdk-amd64/bin/java
fi

exec "$JAVA_BIN" -jar target/desktop-java.jar "$@"
