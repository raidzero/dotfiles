#!/bin/bash
#i3status | while :
#do
#    read line
#    memline="MEM: `free -m | grep "^Mem:" | awk '{printf("%2.0f%%", (($2-$7)/$2)*100)}'`"
#    echo "$memline | $line" || exit 1
#done

i3status | while :
do
	read line
	echo $line > /tmp/i3status
	sleep 2
done
