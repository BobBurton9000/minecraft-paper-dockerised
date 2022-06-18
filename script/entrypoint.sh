#!/usr/bin/env bash

cp /opt/minecraft/eula.txt /home/minecraft/eula.txt
cp /opt/minecraft/server.properties /home/minecraft/server.properties

sed 's,{{SERVER_NAME}},'"${SERVER_NAME}"',g' -i /home/minecraft/server.properties
sed 's,{{VIEW_DISTANCE}},'"${VIEW_DISTANCE}"',g' -i /home/minecraft/server.properties
sed 's,{{MOTD}},'"${MOTD}"',g' -i /home/minecraft/server.properties

bash /opt/minecraft/start.sh