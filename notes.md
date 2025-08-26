# Lancer docker

sudo docker-compose up

# Lancer l'appli web

```sh
mvn clean install verify -Djetty.port=8888

mvn jetty:run  -Djetty.port=8888 -DskipTests=true
```

# Appel de l'api

GET http://localhost:8888/demo