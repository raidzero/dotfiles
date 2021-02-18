#!/bin/bash

xrdb -merge ~/.Xresources &

libinput-gestures-setup start &

swaymsg -t subscribe -m '["window"]' | while read line; do pkill -SIGRTMIN+30 i3blocks; done &
