#!/usr/bin/env python
import i3ipc
import sys

focused_ws = " %%{F#ff00ff54}%s%%{F#ffffffff} "
unfocused_ws = " %s "

def printData(data):
	sys.stdout.flush()
	sys.stdout.write("%s :" % data)
	sys.stdout.flush()

i3 = i3ipc.Connection()

# start off by printing current state
workspaces = i3.get_workspaces()
workspaceLine = ''

for ws in workspaces:
	if ws['focused']:
		workspaceLine += focused_ws % ws.name
	else:
		workspaceLine += unfocused_ws % ws.name

printData(workspaceLine)
	
print ' ' + i3.get_tree().find_focused().name
