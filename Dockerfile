FROM quay.io/vektorcloud/base:3.6

ENV FILEBEAT_VERSION=5.5.0
ENV FILEBEAT_URL=https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-$FILEBEAT_VERSION-linux-x86_64.tar.gz

RUN wget $FILEBEAT_URL -P /tmp \
  && mkdir /opt \
  && tar -C /opt -xvf /tmp/filebeat-* \
  && ln -sv /opt/filebeat-* /opt/filebeat \
  && rm -rf /tmp/*

WORKDIR /opt/filebeat

ENV ES_HOSTS localhost:9200

COPY filebeat.yml /opt/filebeat/

CMD ["-e"]

ENTRYPOINT ["/opt/filebeat/filebeat"]
