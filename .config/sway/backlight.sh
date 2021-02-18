#!/bin/bash

BRIGHTNESS=$(cat /sys/class/backlight/intel_backlight/brightness)

echo "scale=2; ($BRIGHTNESS / 7500) * 100" | bc | sed 's/\..*$/%/'
