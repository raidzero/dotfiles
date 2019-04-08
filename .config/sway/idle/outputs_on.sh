#!/bin/bash
~/.config/sway/toggle_active_outputs.py active


if swaymsg -t get_outputs -r | grep 3840; then
    PREV_HDMI=$(cat /tmp/prev_hdmi_brightness)
    hdmibrightness $PREV_HDMI
fi

rm /tmp/sway_outputs.status
