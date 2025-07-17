# Stage 1: Build the plugin
FROM maven:3.9.6-eclipse-temurin-17 AS builder

WORKDIR /app
COPY . .

# Add custom Maven settings with HTTPS repo for Jenkins plugins
COPY settings.xml /root/.m2/settings.xml

# Run Maven build
RUN mvn clean package

# Stage 2: Optionally test or use built plugin
FROM maven:3.9.6-eclipse-temurin-17

WORKDIR /app
COPY --from=builder /app /app

CMD ["mvn", "test"]
