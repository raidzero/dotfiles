#!/bin/sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

if [ "$HOSTNAME" == "chromebook" ]; then
	CONFIG=~/.config/polybar/laptop
else
	CONFIG=~/.config/polybar/native
fi

polybar -c $CONFIG top &

echo "$CONFIG launched."
