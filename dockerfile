FROM tomcat:latest

MAINTAINER TRINH ANH QUAN

VOLUME /usr/local/tomcat

COPY target/hello-world-war-1.0.0.war "$CATALINA_HOME/webapps/"

CMD ["catalina.sh", "run"]
