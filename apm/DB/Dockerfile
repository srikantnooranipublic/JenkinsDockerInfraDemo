FROM postgres:9.6-alpine

LABEL MAINTAINER="srikant.noorani@ca.com"

LABEL version="10.6.0.179"

COPY scripts/ scripts/

COPY createInstallDatabasesForIntroscope.sh createInstallDatabasesForIntroscope.sh

ENV POSTGRES_USER=postgres \
    POSTGRES_PASSWORD=CAdemo123#


RUN chmod +x createInstallDatabasesForIntroscope.sh \
 && ./createInstallDatabasesForIntroscope.sh

