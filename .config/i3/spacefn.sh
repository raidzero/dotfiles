#!/bin/sh

xmodmap ~/.Xmodmap
xmodmap -e 'keycode 66 = 0x1234'
xmodmap -e 'add control = 0x1234'
xmodmap -e 'keycode any = space'

xcape -e '0x1234=space'
