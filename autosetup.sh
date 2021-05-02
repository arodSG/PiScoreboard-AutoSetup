#!/bin/bash
sudo apt-get update -y
sudo apt-get install -y git python-pip

cd /home/pi
git clone --recursive https://github.com/MLB-LED-Scoreboard/mlb-led-scoreboard
cd mlb-led-scoreboard/
sudo ./install.sh
