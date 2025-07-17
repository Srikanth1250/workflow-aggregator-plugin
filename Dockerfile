# Stage 1: Build the plugin
FROM maven:3.9.6-eclipse-temurin-17 AS builder

WORKDIR /app
COPY . .

# Force Maven to use Jenkins public repo (HTTPS)
RUN mvn clean package -Dmaven.repo.remote=https://repo.jenkins-ci.org/public/

# Stage 2: Optionally run/test or prepare Jenkins with plugin
FROM maven:3.9.6-eclipse-temurin-17

WORKDIR /app
COPY --from=builder /app /app

CMD ["mvn", "test"]
