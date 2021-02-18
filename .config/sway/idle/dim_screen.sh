#!/bin/bash
~/.config/sway/idle/inhibitors/pulse.sh || exit 1
echo "$(date) dim_screen.sh running" >> /tmp/brightness.log

if swaymsg -t get_outputs -r | grep 3840; then
    hdmibrightness get > /tmp/prev_hdmi_brightness
    hdmibrightness 0
fi

# inhibited by AC or pulse?
~/.config/sway/idle/inhibitors/ac.sh || exit 1

BRIGHTNESS_FILE="/sys/class/backlight/intel_backlight/brightness"
MAX_BRIGHTNESS_FILE="/sys/class/backlight/intel_backlight/max_brightness"
MAX=$(cat $MAX_BRIGHTNESS_FILE)
cat $BRIGHTNESS_FILE > /tmp/prev_brightness


let IDLE_BRIGHTNESS=$MAX/200 # 0.5%
echo "wrote brightness 10% ($IDLE_BRIGHTNESS}. max: $MAX" >> /tmp/brightness.log
~/.config/sway/idle/brightness $IDLE_BRIGHTNESS
pkill -SIGRTMIN+20 i3blocks

