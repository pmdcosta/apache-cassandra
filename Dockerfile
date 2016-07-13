FROM gcr.io/google-samples/cassandra:v8
MAINTAINER Pedro Costa

USER root

COPY config/run.sh /run.sh
COPY config/cassandra.yaml /etc/cassandra/cassandra.yaml
COPY config/build.cql /build.cql
COPY config/select.cql /select.cql

CMD ["/run.sh"]