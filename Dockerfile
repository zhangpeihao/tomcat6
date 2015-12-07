FROM java:6-jre

ENV CATALINA_HOME /usr/local/tomcat

ADD apache-tomcat-6.0.37.tar.gz /tmp

RUN set -x \
    mv /tmp/apache-tomcat-6.0.37 $CATALINA_HOME && \
    cd $$CATALINA_HOME && \
	rm bin/*.bat && \
    rm -f /usr/local/tomcat/conf/tomcat-users.xml

ADD tomcat-users.xml /usr/local/tomcat/conf/tomcat-users.xml

ENV PATH $CATALINA_HOME/bin:$PATH
WORKDIR $CATALINA_HOME

EXPOSE 8080
CMD ["catalina.sh", "run"]
