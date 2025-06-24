FROM ubuntu:18.04
RUN apt update
RUN apt install default-jdk -y
RUN apt install maven -y
RUN apt install git -y
RUN git clone https://github.com/shephertz/App42PaaS-Java-MySQL-Sample /tmp/App42PaaS-Java-MySQL-Sample
RUN cd /tmp/App42PaaS-Java-MySQL-Sample && \
    mvn package
RUN cd /tmp/App42PaaS-Java-MySQL-Sample/target
WORKDIR /tmp/app/
RUN cp /tmp/App42PaaS-Java-MySQL-Sample/target/App42PaaS-Java-MySQL-Sample-0.0.1-SNAPSHOT.war /tmp/app/App42PaaS-Java-MySQL-Sample-0.0.1-SNAPSHOT.war