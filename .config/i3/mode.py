#!/usr/bin/env python
import i3connection
import sys

mode_disp = " <span foreground='#ff0054'>[%s]</span> "

i3 = i3connection.getConnection()

def showMode(i3, event):
	mode = event.change
	if mode != 'default':
		sys.stdout.flush()
		sys.stdout.write(mode_disp % mode)
		sys.stdout.flush()
	else:
		sys.stdout.flush()
		sys.stdout.write(' ')
		sys.stdout.flush()

i3.on('mode', showMode)
i3.main()
