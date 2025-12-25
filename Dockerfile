# build
FROM maven:3.9.4-eclipse-temurin-21-alpine AS build
WORKDIR /app
COPY . .
RUN mvn clean install


# run
FROM amazoncorretto:21.0.0
WORKDIR /run
COPY --from=build /app/target/devops-learning-0.0.1-SNAPSHOT.jar /run/devops-learning-0.0.1-SNAPSHOT.jar

EXPOSE 9000
ENTRYPOINT ["java", "-jar", "/run/devops-learning-0.0.1-SNAPSHOT.jar"]