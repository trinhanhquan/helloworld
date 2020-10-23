FROM tomcat:latest

### create by TRINH ANH QUAN
LABEL key="TRINH ANH QUAN"

VOLUME /usr/local/tomcat

EXPOSE 8080

COPY target/*.war "$CATALINA_HOME/webapps/"

CMD ["catalina.sh", "run"]
