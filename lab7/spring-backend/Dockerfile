FROM alpine:3.19.1 as build

ENV MYSQL_ROOT_PASSWORD=root
ENV MYSQL_USER=test
ENV MYSQL_PASSWORD=test
ENV MYSQL_DATABASE=hobbie_db
ENV MYSQL_PORT=3306
ENV DB_HOST=db

RUN apk add openjdk11 maven --no-cache --update

WORKDIR /app

# Install dependencies
COPY pom.xml ./
RUN mvn dependency:resolve

# Build jar
COPY src src
RUN mvn install


FROM alpine:3.19.1

WORKDIR /app

RUN apk add openjdk11-jre-headless --no-cache --update

COPY --from=build /app/target/*.jar ./app.jar

RUN chown 10000:0 -R .

USER 10000

CMD ["java", "-jar", "app.jar"]
