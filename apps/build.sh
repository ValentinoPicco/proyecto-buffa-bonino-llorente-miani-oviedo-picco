#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"

if [ -d /usr/lib/jvm/java-17-openjdk-amd64 ]; then
    export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
fi

echo "Compilando las dos aplicaciones con Java 17..."
mvn clean package

echo
echo "Listo. Ejecutar:"
echo "  ./desktop-java/run.sh"
echo "  ./simulador-rest/run.sh"
