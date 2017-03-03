#!/bin/sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
#~/Projects/polybar/polybar -c ~/.config/polybar/native top &
polybar -c ~/.config/polybar/native top &

echo "Bars launched..."
