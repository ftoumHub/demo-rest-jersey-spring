#!/bin/bash
#
# Script pour lancer OTEL-LGTM (Grafana) et Jetty avec l’agent OpenTelemetry

# Chemin vers l’agent OpenTelemetry
OTEL_AGENT_JAR="$(pwd)/otel/opentelemetry-javaagent.jar"

# Nom du conteneur docker
LGTM_CONTAINER="lgtm"

# Vérifier si le conteneur LGTM est déjà lancé
if ! docker ps --format '{{.Names}}' | grep -q "^${LGTM_CONTAINER}$"; then
  echo "=== Lancement du conteneur Grafana OTEL-LGTM ==="
  docker run --name ${LGTM_CONTAINER} \
    -p 3000:3000 \
    -p 4317:4317 \
    -p 4318:4318 \
    --rm -d grafana/otel-lgtm
  echo "LGTM est en cours de démarrage sur http://localhost:3000"
else
  echo "=== Conteneur LGTM déjà en cours d’exécution ==="
fi

# Variables OpenTelemetry
export OTEL_SERVICE_NAME="demo-rest-jersey"
export OTEL_TRACES_EXPORTER="otlp"
export OTEL_METRICS_EXPORTER="none"
export OTEL_LOGS_EXPORTER="otlp"
export OTEL_EXPORTER_OTLP_ENDPOINT="http://localhost:4318"
export OTEL_TRACES_SAMPLER="traceidratio"
export OTEL_TRACES_SAMPLER_ARG="1.0"
export OTEL_EXPORTER_OTLP_COMPRESSION="gzip"
export OTEL_EXPORTER_OTLP_PROTOCOL="http/protobuf"

export JAVA_HOME=/home/ftoum/.sdkman/candidates/java/8.0.265-open
export PATH=$JAVA_HOME/bin:$PATH

# Ajout de l’agent JVM via MAVEN_OPTS
export MAVEN_OPTS="-javaagent:${OTEL_AGENT_JAR} ${MAVEN_OPTS}"

echo "=== Lancement de Jetty avec OpenTelemetry ==="
echo "Agent : $OTEL_AGENT_JAR"
echo "Service : $OTEL_SERVICE_NAME"
echo "OTLP Endpoint : $OTEL_EXPORTER_OTLP_ENDPOINT"

# Lancer Jetty
/mnt/c/Tools/apache-maven-3.8.8/bin/mvn jetty:run
#mvn jetty:run