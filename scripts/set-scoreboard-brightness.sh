#!/bin/sh -
sed -i "s/--led-brightness=[[:digit:]]\+/--led-brightness=$1/g" /home/pi/start-scoreboard.sh
/home/pi/restart-scoreboard-service.sh