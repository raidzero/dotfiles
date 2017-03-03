urxvtd &
compton -b --config ~/.config/compton/compton.conf &
setxkbmap -option "caps:super" &
dropbox start &
sh ~/.fehbg & # set background
~/.config/i3/polybar.sh &
urxvt -name urxvt_scratchpad -title ScratchPad &
xautolock -locker ~/.config/i3/lockscreen -time 5 &

#xfce daemons
xfsettingsd &
xfce4-power-manager &
xfce4-volumed &
