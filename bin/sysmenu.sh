#!/bin/bash

DMENU="dmenu -nb #000000 -nf #ffffff -sb #ff00ff -sf #000000 -fn Inconsolata-11"
disp="lock\npoweroff\nreboot\nhibernate\nsleep"

CMD=$(echo -e "$disp" | $DMENU)
echo $CMD

case $CMD in
    "lock")
        ~/.config/i3/lockscreen;;
    "poweroff")
        sudo shutdown -P now;;
    "reboot")
        sudo reboot now;;
    "sleep")
        sudo systemctl suspend;;
    "hibernate")
        sudo systemctl hibernate;;
esac
