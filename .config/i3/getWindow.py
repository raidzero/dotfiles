#!/usr/bin/env python
import i3ipc
import sys

def printData():
	sys.stdout.write("%s  %s" % (workspaceLine, windowName))
	sys.stdout.flush()

i3 = i3ipc.Connection()

# start off by printing current state
workspaces = i3.get_tree().workspaces()
workspaceLine = ''

for ws in workspaces:
	workspaceLine += "[%s] " % ws.name

windowName = i3.get_tree().find_focused().name

printData()

def showName(i3, e):
	global windowName

	if e.change in ['focus', 'title', 'empty', 'init']:	
		window = i3.get_tree().find_focused()
			
		if window != None:	
			windowName = window.name
		else:
			windowName = "No window"
	
	printData()
	
def showWorkspaces(i3, e):
	global workspaceLine
	if not e.change in [ 'init', 'focus', 'empty' ]:
		return 

	workspaces = i3.get_tree().workspaces()
	workspaceLine = ''

	for ws in workspaces:
		workspaceLine += "[%s] " % ws.name
	
	printData()

			
i3.on('workspace', showWorkspaces)
i3.on('window', showName)

i3.main()
