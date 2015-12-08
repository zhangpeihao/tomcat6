FROM java:6-jdk
MAINTAINER zhangpeihao@111.com.cn

ADD apache-tomcat-6.0.37.tar.gz /tmp/apache-tomcat-6.0.37

RUN cd /usr/local && \
    mv /tmp/apache-tomcat-6.0.37/apache-tomcat-6.0.37 ./apache-tomcat-6.0.37 && \
    ln -s ./apache-tomcat-6.0.37 ./tomcat && \
    rm -rf /usr/local/tomcat/conf

ENV CATALINA_HOME /usr/local/tomcat

VOLUME /logs
VOLUME /webapps
VOLUME /usr/local/tomcat/conf

CMD /usr/local/tomcat/bin/startup.sh && tail -F /logs/catalina.out

EXPOSE 80 8080


