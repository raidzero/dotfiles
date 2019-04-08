#!/bin/bash
BRIGHTNESS_FILE="/sys/class/backlight/intel_backlight/brightness"
PREV=$(cat /tmp/prev_brightness)

~/.config/sway/idle/brightness $PREV

pkill -SIGRTMIN+20 i3blocks

if swaymsg -t get_outputs -r | grep 3840; then
    PREV_HDMI=$(cat /tmp/prev_hdmi_brightness)
    echo "$(date) prev brightness: ${PREV_HDMI}" >> /tmp/brightness.log
    hdmibrightness $PREV_HDMI
fi
