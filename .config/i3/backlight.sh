#!/bin/bash

CMD=$1

if [ -z "$CMD" ]; then
	echo "Must provide command: up, down"
	exit 1
fi

case $CMD in
	up)
		xbacklight -inc 5 ;;
	down)
		xbacklight -dec 5 ;;
esac

CURRENT_BRIGHTNESS=$(xbacklight -get | sed 's/\.[0-9]*$//')
dunstify -r 1001 "LCD brightness: ${CURRENT_BRIGHTNESS}%"


cat /sys/class/backlight/intel_backlight/brightness > ~/.lcd-brightness
