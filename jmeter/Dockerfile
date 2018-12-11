FROM java:8
  
LABEL MAINTAINER="srikant.noorani@ca.com"

WORKDIR /opt/jmeter

ARG JMETER_VERSION="5.0"
ENV JMETER_HOME=/opt/jmeter  \
  TEST_HOME=/opt/test \
  JMETER_BIN=${JMETER_HOME}/bin  \
  JMETER_DOWNLOAD_URL=https://archive.apache.org/dist/jmeter/binaries/apache-jmeter-${JMETER_VERSION}.tgz


RUN curl ${JMETER_DOWNLOAD_URL} -o jmeter.tgz && \
 tar xf jmeter.tgz


#COPY bin/* ${JMETER_HOME}/bin

RUN mkdir ${TEST_HOME}

COPY JMETER_FILES/JenkinsJmeterTest.jmx ${TEST_HOME}
COPY ["JMETER_FILES/entrypoint.sh", "/"]

RUN   chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
