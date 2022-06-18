#!/usr/bin/env bash

php8 /opt/minecraft/get_latest_paper.php

if [ -f "/home/minecraft/eula.txt" ]; then
  echo "EULA exists";
else
  cp /opt/minecraft/eula.txt /home/minecraft/eula.txt
fi

if [ -f "/home/minecraft/server.properties" ]; then
  echo "Properties exists";
else
  cp /opt/minecraft/server.properties /home/minecraft/server.properties
fi

bash /opt/minecraft/start.sh