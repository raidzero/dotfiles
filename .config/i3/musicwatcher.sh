#!/bin/sh

# Terminate already running bar instances
killall -q musicwatcher.py

# Wait until the processes have been shut down
while pgrep -x musicwatcher.py >/dev/null; do sleep 1; done

~/.config/i3/musicwatcher.py &
