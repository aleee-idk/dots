#!/usr/bin/env bash

# Date
date=$(date "+%a %F %R")

# Battery
battery=$(cat /sys/class/power_supply/BAT*/capacity)

# Alsa master volume
volume=$(amixer get Master | grep "Right:" | cut -f 7,8 -d " ")

# Status bar
echo "Vol: $volume | Bat: ${battery}% | $date"
