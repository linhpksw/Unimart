# Use the official OpenJDK 17 image as a base
FROM openjdk:17-jdk-slim-buster

# Install necessary tools
RUN apt-get update && apt-get install -y curl

# Install Tomcat 10.1.18
# Define environment variables for Tomcat version and installation directory
ENV TOMCAT_VERSION=10.1.19
ENV CATALINA_HOME=/usr/local/tomcat

# Download and install Tomcat to the CATALINA_HOME directory
RUN mkdir -p "$CATALINA_HOME" \
 && curl -fSL "https://dlcdn.apache.org/tomcat/tomcat-10/v$TOMCAT_VERSION/bin/apache-tomcat-$TOMCAT_VERSION.tar.gz" | tar -xz --strip-components=1 -C "$CATALINA_HOME"

# Remove the default web applications from Tomcat
RUN rm -rf "$CATALINA_HOME"/webapps/*

# Copy the WAR file into the Tomcat webapps directory
COPY target/unimart-1.0-SNAPSHOT.war $CATALINA_HOME/webapps/ROOT.war

# Expose port 8080 for the web application
EXPOSE 8080

# Set the default command to run when starting the container
CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]
