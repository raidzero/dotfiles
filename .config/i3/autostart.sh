urxvtd &
compton -b --config ~/.config/compton/compton.conf &
setxkbmap -option "caps:super" &
dropbox start &
sh ~/.fehbg & # set background
~/.config/i3/polybar.sh &
urxvt -name urxvt_scratchpad -title ScratchPad &

#xfce daemons
/usr/lib/x86_64-linux-gnu/xfce4/xfconf/xfconfd & # respect xfce settings
xfsettingsd &
xfce4-power-manager &
xfce4-volumed &
