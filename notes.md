# Développement

Dans WSL, naviguer vers le répertoire :

```sh
cd /mnt/c/dev/swm/demo-rest-jersey-spring/otel

# installer l'agent java opentelemetry
wget https://github.com/open-telemetry/opentelemetry-java-instrumentation/releases/latest/download/opentelemetry-javaagent.jar
```

```sh
# Démarrer la base de données postgresql
sudo docker-compose up postgres
```

# Lancer l'appli web

```sh
sdk use java 8.0.265-open
mvn clean install verify -Djetty.port=8888

mvn jetty:run  -Djetty.port=8888 -DskipTests=true
```

# Lancer l'appli web avec la stack lgtm

```sh
sudo ./mvn-otel.sh
```

# Appel de l'api

GET http://localhost:8888/demo


# OTEL

L'ui est accessible à l'adresse : http://localhost:3000

Dans Grafana : Aller dans Connections > Datasource et cliquer sur 'Explore' sur la ligne 'Tempo'

