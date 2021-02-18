if [ -p /dev/stdin ]; then
    read windowName
else
    windowName="None"
fi

pkill -SIGRTMIN+30 i3blocks
