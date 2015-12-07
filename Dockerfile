FROM java:6-jre

ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH
RUN mkdir -p "$CATALINA_HOME"
WORKDIR $CATALINA_HOME

ADD apache-tomcat-6.0.37.tar.gz /tmp

RUN set -x \
    mv /tmp/apache-tomcat-6.0.37/* . && \
	rm bin/*.bat && \
    rm -f /usr/local/tomcat/conf/tomcat-users.xml

ADD tomcat-users.xml /usr/local/tomcat/conf/tomcat-users.xml

EXPOSE 8080
CMD ["catalina.sh", "run"]
