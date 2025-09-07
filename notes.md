# Lancer docker

Dans WSL, naviguer vers le répertoire :

```shell
cd /mnt/c/dev/swm/demo-rest-jersey-spring/otel

# installer l'agent java opentelemetry
wget https://github.com/open-telemetry/opentelemetry-java-instrumentation/releases/latest/download/opentelemetry-javaagent.jar
```

```shell
cd /mnt/c/dev/swm/demo-rest-jersey-spring

docker-compose up
```

# Lancer l'appli web

```sh
# si besoin
sdk use java 8.0.265-open
mvn clean install verify -Djetty.port=8888

mvn jetty:run  -Djetty.port=8888 -DskipTests=true
```

# Appel de l'api

GET http://localhost:8888/demo


# OTEL

L'ui est accessible à l'adresse : http://localhost:3000

Dans Grafana : Aller dans Connections > Datasource et cliquer sur 'Explore' sur la ligne 'Tempo'

