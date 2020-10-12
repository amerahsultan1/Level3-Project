FROM maven as build

copy . /queue-master

WORKDIR /queue-master

RUN mvn clean  package

FROM weaveworksdemos/msd-java:jre-latest

COPY --from=build /queue-master/target/*.jar ./app.jar

RUN chown -R ${SERVICE_USER}:${SERVICE_GROUP} ./app.jar

ENTRYPOINT ["/usr/local/bin/java.sh","-jar","./app.jar", "--port=80"]
