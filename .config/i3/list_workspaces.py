#!/usr/bin/env python
import i3ipc
import sys

focused_ws = " <span foreground='#00ff54'>%s</span> "
unfocused_ws = " %s "

def printData(data):
	sys.stdout.flush()
	sys.stdout.write("%s :" % data)
	sys.stdout.flush()

i3 = i3ipc.Connection()

# start off by printing current state
workspaces = i3.get_workspaces()
workspaceLine = ''
numWorkspaces = len(workspaces)

wsnum = 1
for ws in workspaces:
	divider = '|'
	if wsnum == numWorkspaces:
		divider = ''
	
	if ws['focused']:
		workspaceLine += (focused_ws + divider) % ws.name
	else:
		workspaceLine += (unfocused_ws + divider) % ws.name
	wsnum += 1

printData(workspaceLine)
	
def showWorkspaces(i3, e):
	if not e.change in [ 'init', 'focus', 'empty', 'rename' ]:
		return 
	
	workspaces = i3.get_workspaces()
	workspaceLine = ''
	numWorkspaces = len(workspaces)
	wsnum = 1

	for ws in workspaces:
		divider = '|'
		if wsnum == numWorkspaces:
			divider = ''
		if ws['focused']:
			workspaceLine += (focused_ws + divider) % ws.name
		else:
			workspaceLine += (unfocused_ws + divider) % ws.name
		wsnum += 1

	printData(workspaceLine)


if not len(sys.argv) > 1:			
	i3.on('workspace', showWorkspaces)

	i3.main()
else:
	sys.stdout.write(' ' + i3.get_tree().find_focused().name)
	sys.stdout.flush()
