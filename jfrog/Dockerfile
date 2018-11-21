FROM centos

LABEL MAINTAINER="srikant.noorani@broadcom.com"


ENV JFROG_INSTALLS = /opt/JFROG-installs && \
    JFROG_HOME = /opt/JFROG && \
    JFROG-RPM = jfrog-artifactory-oss-6.5.3.rpm

WORKDIR  ${JFROG_INSTALLS}

COPY ${JFROG_FILES}/${JFROG_RPM} ${JFROG_INSTALLS}

RUN rpm -i ${JFROG_RPM}

EXPOSE 8080
