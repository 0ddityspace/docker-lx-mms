FROM node:4-alpine

MAINTAINER 0ddity.space

ENV MMS_COMMUNITY_VERSION 1.9.4 

RUN MMS_FILE_NAME_NO_ARCH=mms-v$MMS_COMMUNITY_VERSION-community-linux.tar.gz && \
        apk --update add --virtual deps curl && \
        cd /tmp && \
        curl -O http://packages.litixsoft.de/mms/$MMS_COMMUNITY_VERSION/mms-v$MMS_COMMUNITY_VERSION-community-linux.tar.gz && \
        tar -xvf *.tar.gz && \
        tar -xvf *$(uname -m).tar.gz && \
        cd *$(uname -m) && \
        mkdir /opt && \
        ./install.sh && \
        rm -rf /tmp/* && \
        apk del deps && \
        sed -i s/127.0.0.1/0.0.0.0/g /opt/lx-mms/config.js

EXPOSE 3333

VOLUME ["/root/.mms"]

CMD lx-mms