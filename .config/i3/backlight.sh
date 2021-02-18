#!/bin/bash

CMD=$1

if [ -z "$CMD" ]; then
	echo "Must provide command: up, down"
	exit 1
fi

BRIGHTNESS_FILE=/sys/class/backlight/intel_backlight/brightness

# detemrmine max brightness
MAX_BRIGHTNESS=`cat /sys/class/backlight/intel_backlight/max_brightness`
CURRENT_BRIGHTNESS=`cat $BRIGHTNESS_FILE`

# we want do 0.5% steps
let STEP=$MAX_BRIGHTNESS/200

case $CMD in
	up)
		let BRIGHTNESS=$CURRENT_BRIGHTNESS+$STEP
		if [ $BRIGHTNESS -ge $MAX_BRIGHTNESS ]; then
			BRIGHTNESS=$MAX_BRIGHTNESS
		fi
		;;
	down)
		let BRIGHTNESS=$CURRENT_BRIGHTNESS-$STEP
		if [ $BRIGHTNESS -le 0 ]; then
			BRIGHTNESS=0
		fi
		;;
esac

sudo /home/raidzero/.config/i3/set_brightness.sh $BRIGHTNESS

CURRENT_BRIGHTNESS_PERCENT=`echo "scale=2; ($BRIGHTNESS/$MAX_BRIGHTNESS)*100" | bc | sed 's/\.[0-9]*$//'`
NOTIFY_STR="LCD brightness: ${CURRENT_BRIGHTNESS_PERCENT}%"
dunstify -r 1001 "${NOTIFY_STR}"
echo "$NOTIFY_STR"


cat /sys/class/backlight/intel_backlight/brightness > ~/.lcd-brightness

pkill -SIGRTMIN+20 i3blocks
