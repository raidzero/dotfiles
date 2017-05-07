urxvtd &
~/Projects/idled/idled &

python2 /usr/bin/dropbox start &

sh ~/.fehbg & # set background

~/.config/i3/polybar.sh &

# chrome app hider
~/.config/i3/musicwatcher.sh &

if [ "$HOSTNAME" == "chromebook" ]; then
	# touchpad gestures!
	libinput-gestures-setup start &

	# fix keyboard shortcuts
	setxkbmap -model chromebook_m_ralt -layout us &
fi

sleep 5 && redshift -c ~/.config/redshift.conf &

urxvtc -name urxvt_scratchpad -title ScratchPad &
