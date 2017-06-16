#!/bin/bash

METROID=$1

if [ -n "$METROID" ]; then
	ROMS=$(ls ~/roms/SNES/metroid | grep "\.zip$" | sed 's/\.zip$//g')
else
	ROMS=$(ls ~/roms/SNES | grep "\.zip$" | sed 's/\.zip//g')
fi

SELECTED=$(echo "$ROMS" | dmenu -i -nb '#000000' -nf '#ffffff' -sb '#ff00ff' -sf '#000000' -fn 'Inconsolata 11')

echo "LAUNCHING:"
ls -l "$HOME/roms/SNES/${SELECTED}.zip"

snes9x-gtk "$HOME/roms/SNES/${SELECTED}.zip"
