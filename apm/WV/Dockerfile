FROM jeanblanchard/java:8

# install image

LABEL MAINTAINER="srikant.noorani@ca.com"

WORKDIR /opt/introscope-install

### For new Introscope version you must change the following variables
ENV INTROSCOPE_VERSION=10.6.0.179 
### End for new Introscope version

ENV INTROSCOPE_HOME=/opt/CA/Introscope \
    INTROSCOPE_BIN=introscope-installer-unix-${INTROSCOPE_VERSION}-linuxAMD64.bin \
    STD_WV_FILES=./WV_FILES 
    

COPY ${STD_WV_FILES}/${INTROSCOPE_BIN} /opt/introscope-install/
COPY ["${STD_WV_FILES}/entrypoint.sh", "/"]

COPY ${STD_WV_FILES}/ca-eula.txt ${STD_WV_FILES}/SampleResponseFile.Introscope.txt /opt/introscope-install/

# run the installer and hotfix
RUN chmod +x ${INTROSCOPE_BIN} && \
    ./${INTROSCOPE_BIN} -f SampleResponseFile.Introscope.txt && \
    cd ${INTROSCOPE_HOME} 

LABEL version="${INTROSCOPE_VERSION}"

WORKDIR ${INTROSCOPE_HOME}


EXPOSE 8999


RUN sed -i 's/g.isAccountTrial/false/g' ${INTROSCOPE_HOME}/product/webview/configuration/org.eclipse.osgi/bundles/10/1/.cp/WebContent/ApmServer/scripts/script* \
  chmod +x /entrypoint.sh

COPY ${STD_WV_FILES}/Introscope_WebView.lax  .
COPY ${STD_WV_FILES}/IntroscopeWebView.properties config/

RUN rm -f /opt/introscope-install/${INTROSCOPE_BIN}

ENTRYPOINT ["/entrypoint.sh"]
