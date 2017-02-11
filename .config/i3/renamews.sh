#!/bin/bash

#new_name=`zenity --entry --text "Enter new workspace name" --title "Rename workspace"`
new_name=`i3-input -P "Enter new workspace name: " | grep command | awk -F '= ' '{print$2}'`
if [ -n "${new_name}" ]; then
	~/.config/i3/wsname.py "${new_name}"
fi
