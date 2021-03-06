#!/bin/bash
sudo apt-get update -y
sudo apt-get install -y git python-pip

# install scoreboard software
cd /home/pi
git clone --recursive https://github.com/MLB-LED-Scoreboard/mlb-led-scoreboard
cd mlb-led-scoreboard/
sudo mv main.py scoreboard-main.py
sudo ./install.sh

# move script folder
sudo cp /home/pi/PiScoreboard-AutoSetup/scripts /home/pi

# move custom config file
sudo cp /home/pi/PiScoreboard-AutoSetup/mlb-led-scoreboard/config.json /home/pi/mlb-led-scoreboard/config.json
# move custom ledcoords layout file
sudo cp /home/pi/PiScoreboard-AutoSetup/mlb-led-scoreboard/ledcoords/w64h32.json /home/pi/mlb-led-scoreboard/ledcoords/w64h32.json
# move custom ledcolors layout file
sudo cp /home/pi/PiScoreboard-AutoSetup/mlb-led-scoreboard/ledcolors/scoreboard.json /home/pi/mlb-led-scoreboard/ledcolors/scoreboard.json
# move modified renderers files
sudo cp /home/pi/PiScoreboard-AutoSetup/mlb-led-scoreboard/renderers/pregame.py /home/pi/mlb-led-scoreboard/renderers/pregame.py

# set up service so scoreboard will run automatically on boot
sudo cp /home/pi/PiScoreboard-AutoSetup/service/mlb-led-scoreboard.service /etc/systemd/system/mlb-led-scoreboard.service
sudo systemctl enable mlb-led-scoreboard.service

# create crontab (for pi user) to restart scoreboard automatically every day at 6am
sudo cp /home/pi/PiScoreboard-AutoSetup/crontab/pi /var/spool/cron/crontabs/pi

# install Adafruit RGB matrix software (this step will disable the sound module and eliminate LED flickering)
cd /home/pi
curl https://raw.githubusercontent.com/adafruit/Raspberry-Pi-Installer-Scripts/master/rgb-matrix.sh >rgb-matrix.sh
sudo bash rgb-matrix.sh
# y
# 1
# 1
# y
# y (triggers a reboot)
