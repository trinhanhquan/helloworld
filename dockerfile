FROM tomcat:latest

### create by TRINH ANH QUAN
LABEL key="TRINH ANH QUAN"

VOLUME /usr/local/tomcat

EXPOSE 8080

COPY target/hello-world-war-1.0.0.war "$CATALINA_HOME/webapps/"

CMD ["catalina.sh", "run"]
