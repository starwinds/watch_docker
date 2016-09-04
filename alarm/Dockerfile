FROM hcwoo/supervisor
MAINTAINER hcwoo <steve.woo.321@gmail.com>

RUN apt-get install -y openjdk-6-jdk
RUN apt-get install -y maven
RUN apt-get install -y tomcat7

RUN cd /usr/src/ && git clone http://hochul:qwer1234@rcs.ktcloudware.com/scm/cs/banach.git && cd /usr/src/banach/auth-gate/ && git checkout develop && mvn clean install -DskipTests=true

RUN cd /usr/src/banach/responsebuilder && mvn clean install -DskipTests=true

RUN cd /usr/src/ && git clone http://hochul:qwer1234@rcs.ktcloudware.com/scm/cs/bms.git && cd bms && git checkout develop && cd bms-master/src/main/webapp/WEB-INF && rm -f ./web.xml && mv ./web-dev-alarm.xml ./web.xml

ADD config_change.sh /usr/bin/config_change.sh
RUN config_change.sh

RUN cd /usr/src/bms/bms-master/ && mvn clean install -DskipTests=true
RUN service tomcat7 stop && cp /usr/src/bms/bms-master/target/watch-1.0.0-null.war /var/lib/tomcat7/webapps/ && cd /var/lib/tomcat7/webapps && mv watch-1.0.0-null.war watch.war

#RUN service tomcat7 start

#RUN service tomcat7 stop && cp /usr/src/bms/bms-master/target/watch-1.0.0-null.war /var/lib/tomcat7/webapps/ && cd /var/lib/tomcat7/webapps && mv watch-1.0.0-null.war watch.war

#RUN cd /var/lib/tomcat7/webapps/watch/WEB-INF/ && sed -i '35s/.*/        <param-value>local<\/param-value>  <!-- local \/ remote -->/' web.xml

#RUN cd /var/lib/tomcat7/webapps/watch/WEB-INF/ && sed -i '39s/.*/         <param-value>false<\/param-value>  <!-- true \/ false -->/' web.xml

RUN sed -i 's/JAVA_OPTS=\"-Djava.awt.headless=true -Xmx128m -XX:+UseConcMarkSweepGC\"/JAVA_OPTS=\"-Djava.awt.headless=true -Xmx512m -XX:+UseConcMarkSweepGC\"/' /etc/default/tomcat7

#RUN service tomcat7 restart

EXPOSE 8080
ADD tomcat.sv.conf /etc/supervisor/conf.d/

#RUN sleep 10 && rm -f /var/lib/tomcat7/webapps/watch/WEB-INF/web.xml && cp /usr/src/bms/bms-master/src/main/webapp/WEB-INF/web-dev-alarm.xml /var/lib/tomcat7/webapps/watch/WEB-INF/web.xml
