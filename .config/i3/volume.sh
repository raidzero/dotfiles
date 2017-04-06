#!/bin/bash

CMD=$1

if [ -z "$CMD" ]; then
	echo "Must give command: up, down, mute"
	exit 1
fi

# currently muted?
WASMUTED=`amixer get Master | grep '\[off\]$'`

case $CMD in
	up)
		AMIXER="amixer sset Master 5%+" ;;
	down)
		AMIXER="amixer sset Master 5%-" ;;
	mute)
		AMIXER="amixer sset Master playback toggle" ;;
esac

# if muted already and not asking to mute, unmute
if [ -n "$WASMUTED" ] && [ "$CMD" != "mute" ]; then
	amixer sset Master playback unmute
fi

# run command
$AMIXER

if [ "$CMD" == "mute" ]; then
	MUTED=`amixer get Master | grep '\[off\]$'`
fi

# get current volume
VOL=`amixer get Master | grep \% | cut -d '[' -f2 | tr -d '[]' | head -n 1`

if [ -z "$MUTED" ]; then
	notify-send -r 1000 "Volume set to $VOL."
else 
	notify-send -r 1000 "Sound muted."
fi
