urxvtd &
~/Projects/idled/idled &

dropbox start &

sh ~/.fehbg & # set background

~/.config/i3/polybar.sh &

urxvtc -name urxvt_scratchpad -title ScratchPad &

# chrome app hider
~/.config/i3/musicwatcher.sh &

if [ "$HOSTNAME" == "chromebook" ]; then
	# touchpad gestures!
	libinput-gestures-setup start &

	# fix keyboard shortcuts
	setxkbmap -model chromebook_m_ralt -layout us &
fi
