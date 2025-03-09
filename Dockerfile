# Use a lightweight OpenJDK image as the base
FROM openjdk:17-jdk-slim

# Set the working directory
WORKDIR /app

# Copy the compiled JAR from Jenkins workspace to the container
COPY target/*.jar app.jar

# Expose the application port (Spring Boot default)
EXPOSE 8081

# Run the Spring Boot application
ENTRYPOINT ["java", "-jar", "app.jar"]






