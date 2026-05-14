#!/usr/bin/env sh

SSID="$INFO"

# INFO can be empty during network churn (e.g. VPN connect/disconnect)
# Fall back to IP check before declaring offline
if [ -z "$SSID" ]; then
    IP=$(ipconfig getifaddr en0 2>/dev/null)
    [ -n "$IP" ] && SSID="connected" || SSID=""
fi

if [ -z "$SSID" ]; then
    sketchybar --set wifi icon="󰤭" label="offline"
else
    sketchybar --set wifi icon="󰤨" label="$SSID"
fi
