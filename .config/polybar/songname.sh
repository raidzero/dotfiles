#!/bin/sh

WINDOW_DATA=`wmctrl -l | grep "Google Play Music"`

if [ -z "$WINDOW_DATA" ]; then
	[ -z "$1" ] && echo "No music playing."
	exit 1
fi

HOSTNAME=`hostname`

echo "$WINDOW_DATA" | sed 's/0x[0-9a-f]* *[0-9]* *'"$HOSTNAME"' *//' | sed 's/- Google Play Music$//' | awk -F ' - ' '{print " |   " $2 "- "  $1}'
