FROM eclipse-temurin:21-jdk AS builder

WORKDIR /app

RUN apt-get update && apt-get install -y netcat-openbsd

COPY target/Venti-0.0.1-SNAPSHOT.jar /app/Venti-0.0.1-SNAPSHOT.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "/app/Venti-0.0.1-SNAPSHOT.jar"]
