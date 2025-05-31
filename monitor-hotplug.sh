#!/bin/bash

# monitor-hotplug.sh
# Automatically switch monitor layouts when an external monitor is plugged in or unplugged.
# Designed for use with dwm or other X11 window managers.
#
# Author: Your Name
# License: MIT

# Set your output names here (use `xrandr` to check)
EXTERNAL="DP-2-1"
INTERNAL="eDP-1"

# Store last state to avoid redundant xrandr calls
LAST_STATE=""

while true; do
    # Check if external monitor is connected
    if xrandr | grep "$EXTERNAL connected" >/dev/null; then
        if [ "$LAST_STATE" != "external" ]; then
            # External monitor is connected, set dual monitor layout
            xrandr --output "$INTERNAL" --primary --mode 1920x1080 --pos 320x1080 --rotate normal \
                   --output DP-1 --off --output HDMI-1 --off --output DP-2 --off --output HDMI-2 --off \
                   --output "$EXTERNAL" --mode 2560x1080 --pos 0x0 --rotate normal \
                   --output DP-2-2 --off --output DP-2-3 --off
            LAST_STATE="external"
            echo "Switched to dual monitor layout."
        fi
    else
        if [ "$LAST_STATE" != "internal" ]; then
            # External monitor is disconnected, set single monitor layout
            xrandr --output "$INTERNAL" --primary --mode 1920x1080 --pos 0x0 --rotate normal \
                   --output DP-1 --off --output HDMI-1 --off --output DP-2 --off --output HDMI-2 --off \
                   --output "$EXTERNAL" --off --output DP-2-2 --off --output DP-2-3 --off
            LAST_STATE="internal"
            echo "Switched to single monitor layout."
        fi
    fi
    sleep 2
done
