#!/usr/bin/env python
# -*- coding: utf-8 -*-
## - this script uses i3 IPC to look for a google music window and pulls the name of the song and artist

import i3ipc
import re
import sys

def getSong(windowName):
	m = re.search('(.*) *- *(.*) * - *Google Play Music$', windowName)
	if m and m.group(1) and m.group(2):
		print "♪ {} - {}".format(m.group(2), m.group(1))
	else:
		print ""
	
	sys.exit(0)

# main
i3 = i3ipc.Connection()
tree = i3.get_tree()

for window in tree.leaves():
	m = re.search('Google Play Music', window.name)
	if m:
		print getSong(window.name)

# if we get here, then nothing has been found
sys.exit(1)
