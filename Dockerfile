FROM alpine:3.15.4
ARG version="1.19"
ENV MC_MEMORY 2560
ENV SERVER_NAME "PaperMC"
ENV MOTD "PaperMC"
ENV VIEW_DISTANCE 10
ENV VERSION ${version}

RUN apk update
RUN apk add bash
RUN apk add openjdk17
RUN apk add nano
RUN apk add php8
RUN apk add php8-openssl

RUN mkdir /opt/minecraft
WORKDIR /opt/minecraft

COPY /script/entrypoint.sh /entrypoint.sh
COPY /script/server_start.sh /opt/minecraft/start.sh
COPY /script/get_latest_paper.php /opt/minecraft/get_latest_paper.php

RUN php8 /opt/minecraft/get_latest_paper.php
RUN adduser -D minecraft
USER minecraft

COPY files/server.properties /opt/minecraft/server.properties
COPY files/eula.txt /opt/minecraft/eula.txt

EXPOSE 19132/udp
EXPOSE 25565/tcp

ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]