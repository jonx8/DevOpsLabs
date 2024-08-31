FROM alpine:3.19.1 as build

RUN apk add openjdk11 maven --no-cache --update

WORKDIR /app

# Install dependencies
COPY pom.xml ./
RUN mvn dependency:resolve

# Build jar
COPY src src
RUN mvn install -DskipTests


FROM alpine:3.19.1 

WORKDIR /app

RUN apk add openjdk11-jre-headless --no-cache --update

COPY --from=build /app/target/*.jar ./app.jar

RUN chown 10000:0 -R .
USER 10000

CMD ["java", "-jar", "app.jar"]
