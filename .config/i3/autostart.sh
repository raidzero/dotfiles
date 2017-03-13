urxvtd &
compton -b --config ~/.config/compton/compton.conf &
dropbox start &
sh ~/.fehbg & # set background
~/.config/i3/polybar.sh &
urxvt -name urxvt_scratchpad -title ScratchPad &
xautolock -locker "~/.config/i3/lockscreen & sleep 300 && sudo systemctl suspend" -secure -time 5 &

# chrome app hider
~/.config/i3/musicwatcher.sh &

# fix keybaord shortcuts
setxkbmap -model chromebook_m_ralt -layout us &

# this is needed to make brightness keys work
xfce4-power-manager &
