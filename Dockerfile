FROM ubuntu:latest
WORKDIR /asapp
COPY . .
RUN apt-get update && apt-get install -y openjdk-17-jdk maven wget
RUN mvn clean package && ls -l target/
RUN wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.96/bin/apache-tomcat-9.0.96.tar.gz
RUN tar -xvzf apache-tomcat-9.0.96.tar.gz
# RUN ls -l target/JavaLoginShowcase.war
RUN cp target/*.war /asapp/apache-tomcat-9.0.96/webapps/
ENV CATALINA_HOME /asapp/apache-tomcat-9.0.96
EXPOSE 8080
CMD ["/asapp/apache-tomcat-9.0.96/bin/catalina.sh", "run"]

