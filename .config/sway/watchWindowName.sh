# update window title in i3status
swaymsg -t subscribe -m '["window"]' | while read line; do pkill -SIGRTMIN+30 i3blocks; done
