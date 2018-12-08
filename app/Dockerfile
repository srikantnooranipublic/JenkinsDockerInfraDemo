#FROM centos
FROM java:8
# install image

LABEL MAINTAINER="srikant.noorani@ca.com"

WORKDIR /opt/ca/springbootApp

ENV APP_HOME=/opt/ca/springbootApp\
    APP_FILES=./APP_FILES\
    AGENT_FILE=IntroscopeAgentFiles-NoInstaller10.7.0.136tomcat.unix.tar \
    APP_JAR=InventoryTrackingService-0.0.1-SNAPSHOT.jar\
    AGENT_PROFILE=IntroscopeAgent.profile\
    CUSTOM_PBD=./${APP_FILES}/UserDaoBE.pbd\
    SPRING_BOOT_PBD=spring-boot.pbd\
    SPRING_BOOT_JAR=spring-boot.jar
    

COPY ${APP_FILES}/${AGENT_FILE} ${APP_HOME}

RUN tar xf  ${APP_HOME}/${AGENT_FILE} 

COPY ${APP_FILES}/${APP_JAR} ${APP_HOME}

COPY ${APP_FILES}/${AGENT_PROFILE} ${APP_HOME}/wily/core/config
COPY ${APP_FILES}/${SPRING_BOOT_JAR} ${APP_HOME}/wily/core/ext
COPY ${APP_FILES}/${SPRING_BOOT_PBD} ${APP_HOME}/wily/core/config
COPY ${APP_FILES}/${CUSTOM_PBD} ${APP_HOME}/wily/core/config/hotdeploy

COPY ["${APP_FILES}/entrypoint.sh", "/"]

RUN   chmod +x /entrypoint.sh

expose 8999

ENTRYPOINT ["/entrypoint.sh"]
