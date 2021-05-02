#!/bin/bash
sudo apt-get update -y
sudo apt-get install -y git python-pip

# install scoreboard software
cd /home/pi
git clone --recursive https://github.com/MLB-LED-Scoreboard/mlb-led-scoreboard
cd mlb-led-scoreboard/
sudo ./install.sh

# set up service so scoreboard will run automatically on boot
sudo mv mlb-led-scoreboard.service /etc/systemd/system/mlb-led-scoreboard.service
sudo systemctl enable mlb-led-scoreboard.service

# install Adafruit RGB matrix software (this step will disable the sound module and eliminate LED flickering)
cd /home/pi
curl https://raw.githubusercontent.com/adafruit/Raspberry-Pi-Installer-Scripts/master/rgb-matrix.sh >rgb-matrix.sh
sudo bash rgb-matrix.sh
# y
# 1
# 1
# y
# y (triggers a reboot)
