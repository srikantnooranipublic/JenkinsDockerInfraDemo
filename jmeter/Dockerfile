FROM java:8
  
WORKDIR /opt/jmeter

ENV JMETER_HOME=/opt/jmeter
ENV TEST_HOME=/opt/test

LABEL MAINTAINER="srikant.noorani@ca.com"

#COPY bin/* ${JMETER_HOME}/bin

RUN mkdir ${TEST_HOME}

COPY JMETER_FILES/JenkinsJmeterTest.jmx ${TEST_HOME}
COPY ["JMETER_FILES/entrypoint.sh", "/"]

RUN   chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
