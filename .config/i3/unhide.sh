#!/bin/bash

ID=`xdotool getactivewindow`

xprop -id $ID -f "_NET_WM_STATE" "32a" -remove "_NET_WM_STATE_HIDDEN" 
xprop -id $ID -f "_NET_WM_STATE" "32a" -set "_NET_WM_STATE" "_NET_WM_STATE_SHOWN" 
