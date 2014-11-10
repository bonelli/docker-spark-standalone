FROM java:8-jdk
RUN wget -q http://apache.fastbull.org/spark/spark-1.1.0/spark-1.1.0-bin-hadoop2.4.tgz -O /opt/spark-1.1.0-bin-hadoop2.4.tgz
RUN mkdir -p /opt/spark-1.1.0-bin-hadoop2.4 && tar zxf /opt/spark-1.1.0-bin-hadoop2.4.tgz -C /opt/spark-1.1.0-bin-hadoop2.4

CMD cd /opt/spark-1.1.0-bin-hadoop2.4 && ./sbin/start-master.sh
