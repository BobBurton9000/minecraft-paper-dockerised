#!/usr/bin/env bash

if [ -f "/home/minecraft/eula.txt" ]; then
  echo "EULA exists";
else
  cp /opt/minecraft/eula.txt /home/minecraft/eula.txt
fi

if [ -f "/home/minecraft/server.properties" ]; then
  echo "Properties exists";
else
  cp /opt/minecraft/server.properties /home/minecraft/server.properties
  sed 's,{{SERVER_NAME}},'"${SERVER_NAME}"',g' -i /home/minecraft/server.properties
  sed 's,{{VIEW_DISTANCE}},'"${VIEW_DISTANCE}"',g' -i /home/minecraft/server.properties
  sed 's,{{MOTD}},'"${MOTD}"',g' -i /home/minecraft/server.properties
if

bash /opt/minecraft/start.sh