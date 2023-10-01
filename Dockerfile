#Maven/Java official image
FROM maven:3.8.3-openjdk-17-slim AS BUILD

LABEL authors="ArtBidDevOps"

# Setting working directory
WORKDIR /artbidtest

# Copying pom and source files
COPY ./pom.xml .
COPY src ./src

# Building the project
RUN mvn clean package -DskipTests


# Use OpenJDK 17 Base Image
FROM openjdk:17-jdk-slim

# Copy JAR to prod from builder stage.
COPY --from=BUILD /artbidtest/target/ArtBid-0.0.1-SNAPSHOT.jar /ArtBid-0.0.1-SNAPSHOT.jar

# Set entrypoint to run the jar
ENTRYPOINT ["java", "-jar", "/ArtBid-0.0.1-SNAPSHOT.jar"]