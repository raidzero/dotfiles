#!/bin/sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

if [ "$HOSTNAME" == "chromebook" ] || [ "$HOSTNAME" == "archvm" ]; then
	CONFIG=~/.config/polybar/laptop
else
	CONFIG=~/.config/polybar/native
fi

# run the same bar on all monitors
for OUTPUT in $(xrandr | grep connected | cut -d ' ' -f1); do
	echo "MONITOR=$OUTPUT polybar -c $CONFIG top &"
	MONITOR="$OUTPUT" polybar -c $CONFIG top & 
	echo "$CONFIG launched on $OUTPUT"
done

