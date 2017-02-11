#!/bin/bash

function get_current_ws_name() {
	workspace=0
	# jshon output: one field per line; first name then focues state, then the next name, ...
	while read line; do
        	if [ "$line" = true ]; then
                	break # break if we found the active workspace 
        	else
                	workspace="$line" # evaluate the next workspace
        	fi
	done < <(i3-msg -t get_workspaces | jshon -a -e name -u -p -e focused -u)
	echo $workspace # name of active workspace
}

CURRENT_NAME=`get_current_ws_name`
ACTIVE_WINDOW=`xdotool getactivewindow getwindowname 2> /dev/null || echo "No Window"`

i3-msg "rename workspace \"${CURRENT_NAME}\" to \"${ACTIVE_WINDOW}\""
