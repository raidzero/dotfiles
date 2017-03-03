#!/bin/sh
/usr/lib/x86_64-linux-gnu/xfce4/xfconf/xfconfd & # respect xfce settings
xfsettingsd &
xfce4-power-manager &
xfce4-volumed &
