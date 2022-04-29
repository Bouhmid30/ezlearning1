FROM maven:3.5-jdk-8-alpine as builder

WORKDIR /app
COPY pom.xml .
COPY src ./src

RUN mvn clean package -DskipTests

FROM openjdk:8-jdk-alpine

COPY --from=builder /app/target/*.jar /ez-learning.jar

EXPOSE 8080

ENTRYPOINT ["java","-jar","ez-learning.jar"]

