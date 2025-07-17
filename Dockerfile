# Stage 1: Build the plugin with Maven
FROM maven:3.9.6-eclipse-temurin-17 AS builder

WORKDIR /app
COPY . .

# Build the plugin (you can also use `test` here if needed)
RUN mvn clean package

# Stage 2: Run container that executes tests (optional)
FROM maven:3.9.6-eclipse-temurin-17

WORKDIR /app
COPY --from=builder /app /app

# Set default command to run tests (you can change this to anything)
CMD ["mvn", "test"]
