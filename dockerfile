    FROM ubuntu:18.04
    RUN apt update
    RUN apt install default-jdk -y
    RUN apt install maven -y
    RUN apt install git -y
    RUN git clone https://github.com/shephertz/App42PaaS-Java-MySQL-Sample /tmp/App42PaaS-Java-MySQL-Sample
    RUN cd /tmp/App42PaaS-Java-MySQL-Sample && \
        mvn package
    RUN cd /tmp/App42PaaS-Java-MySQL-Sample/WebContent && sed -i 's/"192.168.2.175"/mysql/' Config.properties
    WORKDIR /tmp/App42PaaS-Java-MySQL-Sample/WebContent/
    RUN sed -i 's/app42.paas.db.username = "acp4pogynvaeidfj"/app42.paas.db.username = acp4pogynvaeidfj/' Config.properties
    RUN sed -i 's/app42.paas.db.port = "8514"/app42.paas.db.port = 8514/' Config.properties
    RUN sed -i 's/app42.paas.db.password = "jc31d2qyy7h9jv5jn1u9uosjksxzaizw"/app42.paas.db.password = jc31d2qyy7h9jv5jn1u9uosjksxzaizw/' Config.properties
    RUN sed -i 's/app42.paas.db.name = "dd"/app42.paas.db.name = dd/' Config.properties
    RUN cd /tmp/App42PaaS-Java-MySQL-Sample/target
    WORKDIR /tmp/app/
    RUN cp /tmp/App42PaaS-Java-MySQL-Sample/target/App42PaaS-Java-MySQL-Sample-0.0.1-SNAPSHOT.war /tmp/app/App42PaaS-Java-MySQL-Sample-0.0.1-SNAPSHOT.war
    RUN cp /tmp/App42PaaS-Java-MySQL-Sample/WebContent/Config.properties /tmp/app/ROOT/Config.properties