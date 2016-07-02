#!/usr/bin/env python
import i3ipc
import sys

focused_ws = " <span foreground='#00ff54' underline='single'>%s</span> "
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
	
def showWorkspaces(i3, e):
	if not e.change in [ 'init', 'focus', 'empty', 'rename' ]:
		return 
	
	workspaces = i3.get_workspaces()
	workspaceLine = ''

	for ws in workspaces:
		if ws['focused']:
			workspaceLine += focused_ws % ws.name
		else:
			workspaceLine += unfocused_ws % ws.name
	
	printData(workspaceLine)

			
i3.on('workspace', showWorkspaces)

i3.main()
