# Stage 1: Build Stage
FROM maven:3.8-openjdk-8 AS build

# Set working directory
WORKDIR /app

# Copy Maven configuration to leverage caching
COPY pom.xml .
RUN mvn dependency:go-offline

# Copy application source code
COPY . .

# Build the WAR file
RUN mvn package -DskipTests

# Stage 2: Runtime Stage
FROM openjdk:8-jre-alpine

# Set working directory
WORKDIR /app

# Install bash (required for entrypoint.sh)
RUN apk add --no-cache bash

# Copy the WAR file from the build stage
COPY --from=build /app/target/lavagna-jetty-console.war /app/lavagna-jetty-console.war

# Copy entrypoint script
COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

# Expose port 8080
EXPOSE 8080

# Set the entrypoint
ENTRYPOINT ["/app/entrypoint.sh"]
