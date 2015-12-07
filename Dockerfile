FROM java:6-jdk
MAINTAINER zhangpeihao@111.com.cn

ADD apache-tomcat-6.0.37.tar.gz /tmp/apache-tomcat-6.0.37

RUN cd /usr/local && \
    mv /tmp/apache-tomcat-6.0.37/apache-tomcat-6.0.37 ./apache-tomcat-6.0.37 && \
    ln -s ./apache-tomcat-6.0.37 ./tomcat && \
    rm -f /usr/local/tomcat/conf/tomcat-users.xml

ADD tomcat-users.xml /usr/local/tomcat/conf/tomcat-users.xml

ENV CATALINA_HOME /usr/local/tomcat

VOLUME /logs
VOLUME /webapps

RUN rm -f /usr/local/tomcat/conf/logging.properties && \
    rm -f /usr/local/tomcat/conf/server.xml

ADD logging.properties /usr/local/tomcat/conf/logging.properties
ADD server.xml /usr/local/tomcat/conf/server.xml

CMD /usr/local/tomcat/bin/startup.sh && tail -F /logs/catalina.out

EXPOSE 80 8080


