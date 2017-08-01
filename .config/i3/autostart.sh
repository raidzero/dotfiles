#!/bin/bash

xrdb -merge ~/.Xresources
setxkbmap -option 'caps:super'
xset r rate 300 30

urxvtd &
~/Projects/idled/idled &

python2 /usr/bin/dropbox start &

sh ~/.fehbg & # set background


# chrome app hider
#~/.config/i3/musicwatcher.sh &

if [ "$HOSTNAME" == "chromebook" ]; then

	# fix keyboard shortcuts
	setxkbmap -model chromebook_m_ralt -layout us &
fi

# touchpad gestures!
libinput-gestures-setup start &

urxvtc -name urxvt_scratchpad -title ScratchPad &

~/.config/i3/musicwatcher.sh &

~/.config/i3/polybar.sh &

sleep 10 # wait ten seconds? idk why but its needed
pgrep redshift &> /dev/null || echo `date` > ~/.redshift.log && redshift -v -c ~/.config/redshift.conf &>> ~/.redshift.log &
