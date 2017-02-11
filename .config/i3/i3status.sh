#!/bin/sh

i3status | while :
do
	read line
	echo $line > /tmp/i3status
	sleep 2
done
