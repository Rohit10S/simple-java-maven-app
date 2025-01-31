#git
FROM alpine/git as git

WORKDIR /app
RUN git clone https://github.com/Rohit10S/simple-java-maven-app.git

#Maven
FROM maven:3.8.6-openjdk-11 as build
WORKDIR /app
COPY --from=git /app/simple-java-maven-app  /app
RUN mvn package

#java
FROM openjdk:11-jre
WORKDIR /
COPY --from=build /app/target/my-app-1.0-SNAPSHOT.jar /my-app-1.0-SNAPSHOT.jar
CMD ["java", "-jar", "my-app-1.0-SNAPSHOT.jar"]
