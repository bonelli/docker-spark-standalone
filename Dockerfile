FROM java:8-jdk
RUN wget -q http://apache.fastbull.org/spark/spark-1.1.0/spark-1.1.0-bin-hadoop2.4.tgz -O /opt/spark-1.1.0-bin-hadoop2.4.tgz
RUN tar zxf /opt/spark-1.1.0-bin-hadoop2.4.tgz -C /opt/

RUN groupadd -r spark -g 999 && useradd -u 999 -r -g spark -d /opt/spark-1.1.0-bin-hadoop2.4 -s /sbin/nologin -c "Docker image user" spark && chown -R spark:spark /opt/spark-1.1.0-bin-hadoop2.4

ENV SPARK_WORKER_DIR /work

VOLUME /tmp
VOLUME /opt/spark-1.1.0-bin-hadoop2.4/logs
VOLUME /work
VOLUME /home

USER spark

CMD cd /opt/spark-1.1.0-bin-hadoop2.4 && ./sbin/start-master.sh
