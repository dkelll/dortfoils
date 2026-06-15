#!/usr/bin/env sh

IP=$(ipconfig getifaddr en0 2>/dev/null)

if [ -n "$IP" ]; then
    sketchybar --set wifi icon="󰤨" label="Connected"
else
    sketchybar --set wifi icon="󰤭" label="Offline"
fi
