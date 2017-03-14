#!/usr/bin/env python2
import i3ipc
import subprocess

# process all windows on this workspace. hide when leaving and show when entering
# because chrome/ium doesnt consider itself hidden when on an invisible workspace
# this script drops my cpu usage when listening to google music from ~10% to ~3% 

# I'm just putting any workspaces that have chromium apps running on them
WATCHED_WORKSPACES = [5, 6]

HIDDEN = '_NET_WM_STATE_HIDDEN'
SHOWN = '_NET_WM_STATE_SHOWN'

def showWindow(windowId):
	print "SHOWING"
	
	subprocess.call(["xprop", "-id", str(windowId), "-f",
	"_NET_WM_STATE", "32a", "-remove", HIDDEN])
	subprocess.call(["xprop", "-id", str(windowId), "-f",
	"_NET_WM_STATE", "32a", "-set", "_NET_WM_STATE", SHOWN])


def hideWindow(windowId):
	print "HIDING"
	
	subprocess.call(["xprop", "-id", str(windowId), "-f",
	"_NET_WM_STATE", "32a", "-remove", SHOWN])
	subprocess.call(["xprop", "-id", str(windowId), "-f",
	"_NET_WM_STATE", "32a", "-set", "_NET_WM_STATE", HIDDEN])


def process_window(window, ws_event):
	print "Processing window: %s (%d)" % (window.name, window.window)
	

	if ws_event.current.num in WATCHED_WORKSPACES:
		# music workspace has been focused
		showWindow(window.window)
	elif ws_event.old.num in WATCHED_WORKSPACES:
		# music workspace has been unfocused
		hideWindow(window.window)

def onWorkspace(i3, event):
	if event.change in ['focus']:
		windows = i3.get_tree().leaves()
		for window in windows:
			if window.workspace().num in WATCHED_WORKSPACES:
				process_window(window, event)

i3 = i3ipc.Connection()

i3.on('workspace', onWorkspace)
i3.main()
