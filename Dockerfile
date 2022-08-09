FROM amazoncorretto:18-alpine
ENV MC_MEMORY 2560
ENV VERSION "1.19"

RUN apk update
RUN apk add bash
RUN apk add nano
RUN apk add php8
RUN apk add php8-openssl

RUN mkdir /opt/minecraft
WORKDIR /opt/minecraft

COPY /script/entrypoint.sh /entrypoint.sh
COPY /script/server_start.sh /opt/minecraft/start.sh
COPY /script/get_latest_paper.php /opt/minecraft/get_latest_paper.php

COPY files/server.properties /opt/minecraft/server.properties
COPY files/eula.txt /opt/minecraft/eula.txt

EXPOSE 25575/tcp
EXPOSE 25565/tcp

ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]