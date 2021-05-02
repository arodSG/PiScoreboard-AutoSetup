#!/bin/bash
sudo apt-get update
sudo apt-get install git python-pip

cd /home/pi
git clone --recursive https://github.com/MLB-LED-Scoreboard/mlb-led-scoreboard
cd mlb-led-scoreboard/
sudo ./install.sh
