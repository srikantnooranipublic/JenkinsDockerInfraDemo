FROM centos
# install image

LABEL MAINTAINER="srikant.noorani@ca.com"

WORKDIR /opt/introscope-install

### For new Introscope version you must change the following variables
ENV INTROSCOPE_VERSION=10.6.0.179 
#ENV INTROSCOPE_VERSION=10.7.0.132
### End for new Introscope version

ENV INTROSCOPE_HOME=/opt/CA/Introscope \
    INTROSCOPE_BIN=introscope-installer-unix-${INTROSCOPE_VERSION}-linuxAMD64.bin \
    STD_EM_FILES=./EM_FILES

COPY ${STD_EM_FILES}/${INTROSCOPE_BIN} /opt/introscope-install/
COPY ["${STD_EM_FILES}/entrypoint.sh", "/"]

COPY ${STD_EM_FILES}/ca-eula.txt ${STD_EM_FILES}/SampleResponseFile.Introscope.txt /opt/introscope-install/

#RUN 'echo "10.238.238.47 centOS7.5-aop.dev.fco" >> /etc/hosts' && \
RUN   chmod +x /entrypoint.sh

# run the installer and hotfix - Need AOP i.e VPN
RUN chmod +x ${INTROSCOPE_BIN} && \ 
 ./${INTROSCOPE_BIN} -f SampleResponseFile.Introscope.txt

RUN cd ${INTROSCOPE_HOME} 

LABEL version="${INTROSCOPE_VERSION}"

WORKDIR ${INTROSCOPE_HOME}

RUN mkdir ${INTROSCOPE_HOME}/link/


EXPOSE 5001 8081 8444


COPY ${STD_EM_FILES}/em-jetty-config.xml  config/
COPY ${STD_EM_FILES}/Introscope_Enterprise_Manager.lax  .
COPY ${STD_EM_FILES}/IntroscopeEnterpriseManager.properties config/
COPY ${STD_EM_FILES}/tess-db-cfg.xml config/

RUN rm -f /opt/introscope-install/${INTROSCOPE_BIN} && \
	chmod -R 755 ${INTROSCOPE_HOME}


ENTRYPOINT ["/entrypoint.sh"]
