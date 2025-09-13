# demo-rest-jersey-spring @ [![Codingpedia.org 100%](http://img.shields.io/badge/Codingpedia.org-100%25-blue.svg)](http://www.codingpedia.org)

## Prerequisites:
* PostgreSQL 14 
* IDE 
* JDK 8
* Maven 3.*

## Install and run the project 
1. download/clone the project 
2. run docker-compose up postgres
  * connect to the database (demo_rest_jersey/demo_rest_jersey)
  * import in PostgreSQL the self-contained file that comes with the project - [demo-rest-jersey-spring/src/main/resources/input_data/DumpRESTdemoDB.sql](https://github.com/ftoumHub/demo-rest-jersey-spring/blob/master/src/main/resources/input_data/DumpRESTdemoDB.sql)
3. change to the root folder of the project and execute the following maven command 
  * `mvn clean install jetty:run  -Djetty.port=8888 -DskipTests=true`
  * now the REST api is up and running with Jetty on `localhost:8888`

## Testing the project 

### From Maven (failsafe plugin)
Run the following maven command on the console in the root directory of the project 
  
```sh
mvn clean install verify -Djetty.port=8888
```


## Go to blog post
[Tutorial – REST API design and implementation in Java with Jersey and Spring](http://www.codingpedia.org/ama/tutorial-rest-api-design-and-implementation-in-java-with-jersey-and-spring/) - complete explanation of this implementation. 

## OTEL-LGTM

Thanks to grafana blog, we can launch a complete observability stack :
https://grafana.com/blog/2025/07/08/observability-in-under-5-seconds-reflecting-on-a-year-of-grafana/otel-lgtm/

run the mvn-otel.sh script to startup the observability stack.

## Zero-code instrumentation

### Configuring auto-instrumentation

https://opentelemetry.io/docs/zero-code/java/agent/getting-started/

### Annotations

https://opentelemetry.io/docs/zero-code/java/agent/annotations/

### Direct Projections instead of JPA Entities to Domain conversion