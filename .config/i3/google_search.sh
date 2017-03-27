#!/bin/bash

query=`i3-input -P "Search query: " | grep command | awk -F 'command = ' '{print$2}'`

if [ -n "${query}" ]; then
	# chromium running? get its window id
	ID=`wmctrl -l | grep Chromium | cut -d' ' -f1`

	if [ -z "$ID" ]; then
		# no. switch to www workspace 
		i3-msg workspace '3:www'
	else
		# yes. focus it
		i3-msg '[id='"$ID"'] focus'
	fi

	# open a new google search with the query :)
	chromium https://google.com/search?q="${query}"
fi
