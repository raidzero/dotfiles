urxvtd &
~/Projects/idled/idled &

dropbox start &

sh ~/.fehbg & # set background

~/.config/i3/polybar.sh &

<<<<<<< HEAD
=======

>>>>>>> 64675ea63b0661b90486f467ec4a1f90cc3d4b2f
# chrome app hider
~/.config/i3/musicwatcher.sh &

if [ "$HOSTNAME" == "chromebook" ]; then
	# touchpad gestures!
	libinput-gestures-setup start &

	# fix keyboard shortcuts
	setxkbmap -model chromebook_m_ralt -layout us &
fi

<<<<<<< HEAD
=======
if [ "$HOSTNAME" == "baseline" ]; then
	# nvidia driver needs compton for tearing...
	compton --config ~/.config/compton/compton.conf &
fi

sleep 5 && redshift -c ~/.config/redshift.conf &

>>>>>>> 64675ea63b0661b90486f467ec4a1f90cc3d4b2f
urxvtc -name urxvt_scratchpad -title ScratchPad &
