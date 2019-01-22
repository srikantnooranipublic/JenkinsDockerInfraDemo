FROM srikns/ca-apm-jenkins:2.0

LABEL MAINTAINER="srikant.noorani@ca.com"

USER root

RUN /bin/rm -rf /etc/sudoers

RUN apt-get update && apt-get install -y maven && apt-get install -y sudo && rm -rf /var/lib/apt/lists/*

RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers

RUN gpasswd -a jenkins root

USER jenkins
