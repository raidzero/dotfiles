#!/usr/bin/env python
import i3ipc
import sys

def printData(data):
	sys.stdout.write("%s :" % data)
	sys.stdout.flush()

i3 = i3ipc.Connection()

# start off by printing current state
workspaces = i3.get_workspaces()
workspaceLine = ''

for ws in workspaces:
	if ws['focused']:
		workspaceLine += " [<span foreground='#00ff54'>%s</span>] " % ws.name
	else:
		workspaceLine += " %s " % ws.name

printData(workspaceLine)
	
def showWorkspaces(i3, e):
	if not e.change in [ 'init', 'focus', 'empty' ]:
		return 
	
	workspaces = i3.get_workspaces()
	workspaceLine = ''

	for ws in workspaces:
		if ws['focused']:
			workspaceLine += " [<span foreground='#00ff54'>%s</span>] " % ws.name
		else:
			workspaceLine += " %s " % ws.name
	
	printData(workspaceLine)

			
i3.on('workspace', showWorkspaces)

i3.main()
