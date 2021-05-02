#!/bin/bash
sudo python /home/pi/mlb-led-scoreboard/scoreboard-main.py --led-gpio-mapping='adafruit-hat-pwm' --led-rows=32 --led-cols=64 --led-slowdown-gpio=4 --led-brightness=100