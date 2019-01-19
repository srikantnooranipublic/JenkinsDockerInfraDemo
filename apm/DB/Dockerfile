FROM postgres:9.6-alpine

LABEL MAINTAINER="srikant.noorani@ca.com"

LABEL version="10.6.0.179"

COPY scripts/ scripts/

COPY ./DB_FILES/createInstallDatabasesForIntroscope.sh createInstallDatabasesForIntroscope.sh

ENV POSTGRES_USER=postgres \
    POSTGRES_PASSWORD=CAdemo123#


RUN chmod +x createInstallDatabasesForIntroscope.sh \
 && ./createInstallDatabasesForIntroscope.sh

COPY ./DB_FILES/dbrestore-postgres.sh /usr/local/bin/dbrestore-postgres.sh
COPY ./DB_FILES/DBScript.sh /usr/local/bin/DBScript.sh
COPY ./DB_FILES/dbbackup-postgres.sh /usr/local/bin/dbbackup-postgres.sh

RUN chown root:root /usr/local/bin/dbrestore-postgres.sh /usr/local/bin/DBScript.sh /usr/local/bin/dbbackup-postgres.sh \
  && chmod +x /usr/local/bin/dbrestore-postgres.sh /usr/local/bin/DBScript.sh /usr/local/bin/dbbackup-postgres.sh \
  && mkdir /CEM_DB


