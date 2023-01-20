FROM maven:3.6.3-jdk-8 AS build
COPY src /home/app
COPY pom.xml /home/app
RUN mvn - /home/app/pom.xml clean package

FROM openjdk:8
ADD target/s1-movie-catalog-service-0.0.1-SNAPSHOT.jar s1-movie-catalog-service-0.0.1-SNAPSHOT.jar
EXPOSE 8081
ENTRYPOINT ["java", "-jar", "s1-movie-catalog-service-0.0.1-SNAPSHOT.jar"]
