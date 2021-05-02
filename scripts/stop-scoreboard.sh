#!/bin/bash
sudo systemctl stop mlb-led-scoreboard.service
sudo pkill -f scoreboard-main.py
echo "Scoreboard service stopped and process killed."