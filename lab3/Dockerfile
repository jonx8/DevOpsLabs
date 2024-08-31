FROM alpine:3.19.1 as build
WORKDIR /app

RUN apk add openjdk11 --no-cache --update

COPY mvnw .
COPY .mvn .mvn
COPY pom.xml .
RUN ./mvnw dependency:go-offline

COPY src src
RUN ./mvnw install -DskipTests



FROM alpine:3.19.1
WORKDIR /app

RUN apk add openjdk11-jre-headless --no-cache --update

COPY --from=build /app/target /app

RUN chown 10000:0 -R /app

USER 10000

EXPOSE 8080

CMD ["java", "-jar", "spring-boot-postgres-flyway-0.0.1-SNAPSHOT.jar"]
