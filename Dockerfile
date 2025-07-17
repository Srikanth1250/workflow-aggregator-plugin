FROM maven:3.9.6-eclipse-temurin-17

WORKDIR /app

# Add plugin source
COPY . .

# Add Maven settings to use HTTPS Jenkins repo
COPY settings.xml /root/.m2/settings.xml

# Build the plugin
RUN mvn clean package

# Optional test or shell
CMD ["mvn", "test"]
