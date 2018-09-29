#!/bin/bash

xrdb -merge ~/.Xresources
setxkbmap -option 'caps:super'
xset r rate 300 30

export QT_QPA_PLATFORMTHEME=qt5ct

urxvtd &
if [ "$HOSTNAME" == "xps" ]; then
	~/Projects/idled/idled &
	compton --config ~/.config/compton/compton.conf -b
fi

python2 /bin/dropbox start &

sh ~/.fehbg & # set background

# touchpad gestures!
libinput-gestures-setup start &

urxvtc -name urxvt_scratchpad -title ScratchPad &

~/.config/i3/musicwatcher.sh &

~/.config/i3/polybar.sh &

sleep 10 # wait ten seconds? idk why but its needed
/usr/lib/geoclue-2.0/demos/agent & # start geo clue agent
pgrep redshift &> /dev/null || echo `date` > ~/.redshift.log && redshift -v -c ~/.config/redshift.conf &>> ~/.redshift.log &
