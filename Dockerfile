# this is builder

FROM maven:3.9.6-eclipse-temurin-17 AS builder


# Set working directory inside the container
WORKDIR /app

# Copy the project files into the container
COPY . .

# Build the project using Maven
RUN mvn clean package -DskipTests

# Use a lightweight JDK runtime for the final image
FROM openjdk:17-jdk-slim

# Set working directory
WORKDIR /app

# Copy only the built JAR from the previous stage
COPY --from=builder /app/target/*.jar app.jar

# Expose the Spring Boot default port
EXPOSE 8081

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]








