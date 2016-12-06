#!/usr/bin/env python2
import i3ipc
import string

workspace_defaults = {
	1: "1:term",
	2: "2:code",
	3: "3:www",
	4: "4:ssh",
	5: "5:chat",
	6: "6:music",
	7: "7",
	8: "8",
	9: "9",
	10: "10:game"
}


def truncate_name(name):
	length = 100
	print name
	name = name.replace("&", "+").replace("\"", "\\\"").replace("\'", "\'")
	truncated = name[:length] + (name[length:] and '...')
	return filter(lambda x: x in set(string.printable), truncated)

def process_workspaces(tree):
	# get currently focused window
	window = tree.find_focused()
	
	# get its name and workspace
	new_name = window.name
	workspace = window.workspace()
	
	# operate on all workspaces in the tree
	for ws in tree.workspaces():
		current_name = ws.name
		
		# assume new name is the default
		new_name = workspace_defaults[ws.num]
		
		# if we actually have a window name and ws is the current workspace, make a new name	
		if ws != None and workspace != None and ws.num == workspace.num and window.name != None:
			new_name = "%d:%s" % (workspace.num, truncate_name(window.name))
		
		# do the rename on this workspace
		i3.command("rename workspace \"%s\" to \"%s\"" % (current_name, new_name))
	
def on_event(i3, e):
	if e.change in ['focus', 'title', 'empty', 'init']:
		process_workspaces(i3.get_tree())
		
i3 = i3ipc.Connection()

i3.on('workspace', on_event)
i3.on('window', on_event)

i3.main()
