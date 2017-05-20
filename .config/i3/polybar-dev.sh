#!/bin/sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

if [ "$HOSTNAME" == "chromebook" ] || [ "$HOSTNAME" == "archvm" ] || [ "$HOSTNAME" == "xps13" ]; then
	CONFIG=~/.config/polybar/laptop-dev
else
	CONFIG=~/.config/polybar/native
fi

# run the same bar on all monitors
for OUTPUT in $(xrandr | grep " connected" | cut -d ' ' -f1); do
	echo "MONITOR=$OUTPUT ~/Projects/polybar/build/bin/polybar -c $CONFIG top &"
	MONITOR="$OUTPUT" ~/Projects/polybar/build/bin/polybar -c $CONFIG top &
	echo "$CONFIG launched on $OUTPUT"
done

