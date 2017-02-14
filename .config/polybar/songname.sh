#!/bin/sh

WINDOW_DATA=`wmctrl -l | grep "Google Play Music"`

if [ -z "$WINDOW_DATA" ]; then
	exit 1
fi

HOSTNAME=`hostname`

echo "$WINDOW_DATA" | sed 's/0x[0-9a-f]* *[0-9]* *'"$HOSTNAME"' *//' | sed 's/- Google Play Music$//' | awk -F ' - ' '{if($2 != ""){print "  " $2 " - " $1}else{print ""}}'
