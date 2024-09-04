FROM maven:3.8.4-jdk-8-slim as maven
COPY ./pom.xml ./pom.xml
COPY ./src ./src
RUN mvn clean install -DskipTests=true
FROM tomcat:8.0.20-jre8
WORKDIR /app
COPY --from=maven /target/maven-web-application*.war /usr/local/tomcat/webapps/maven-web-application.war


