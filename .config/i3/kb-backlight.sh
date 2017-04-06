#!/bin/bash

CMD=$1

if [ -z "$CMD" ]; then
	echo "Must provide command: up, down"
	exit 1
fi

case $CMD in
	up)
		~/.config/i3/kb-light.py + ;;
	down)
		~/.config/i3/kb-light.py - ;;
esac

notify-send -r 1002 "Keyboard brightness: `~/.config/i3/kb-light.py --get`"
