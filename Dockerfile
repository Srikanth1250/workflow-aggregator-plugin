# Use Maven with Java 17
FROM maven:3.9.6-eclipse-temurin-17

# Set working directory inside the container
WORKDIR /app

# Copy your plugin source code into the container
COPY . .

# Run Maven build
RUN mvn clean package

# Default command (optional, can be changed)
CMD ["mvn", "test"]
