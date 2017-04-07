FROM node:4-alpine

MAINTAINER 0ddity.space

ENV MMS_COMMUNITY_VERSION 1.9.4 
ENV PORT 3333

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
        sed -i s/127.0.0.1/0.0.0.0/g /opt/lx-mms/config.js && \
        sed -i 's/window.io.sockets\[window.location.origin\]/window.io.sockets\[window.location.origin\]||window.io.sockets\[Object.keys(window.io.sockets)[0]\]/g' /opt/lx-mms/.dist/public/scripts/main/*.scripts.js 

VOLUME ["/root/.mms"]

CMD sed -i s/3333/$PORT/g /opt/lx-mms/config.js && lx-mms
