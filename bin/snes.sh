#!/bin/bash

METROID=$1

if [ -n "$METROID" ]; then
	ROMPATH="$HOME/roms/SNES/metroid"
else
	ROMPATH="$HOME/roms/SNES"
fi

ROMS=$(ls "$ROMPATH" | grep "\.zip$" | sed 's/\.zip//g')

SELECTED=$(echo "$ROMS" | dmenu -i -nb '#000000' -nf '#ffffff' -sb '#ff00ff' -sf '#000000' -fn 'Inconsolata 11')

if [ -n "$SELECTED" ]; then
	echo "LAUNCHING:"
	ls -l "${ROMPATH}/${SELECTED}.zip"

	snes9x-gtk "${ROMPATH}/${SELECTED}.zip"
fi
