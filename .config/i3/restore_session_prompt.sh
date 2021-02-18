#!/bin/bash
HIST=~/.cache/i3

if [ -f $HIST/apps.running ] && [ -f $HIST/session.json ]; then
	Xdialog --title "Restore previous session?" \
		--yesno "There is previous session data available. Would you like to restore it?" \
		10 80

	case $? in
		0)
			~/.config/i3/i3session restore
			;;
		1)
			exit 0
			;;
		255)
			exit 0
			;;
	esac
fi
