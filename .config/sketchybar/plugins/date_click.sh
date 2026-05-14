#!/usr/bin/env sh

sketchybar --set clock.date label="$(date '+%A')"
sleep 3
sketchybar --set clock.date label="$(date '+%d-%b-%Y')"
