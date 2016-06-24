#!/usr/bin/env python2
import i3ipc
import string

workspace_defaults = {
	1: "1:term",
	2: "2:code",
	3: "3:www",
	4: "4:ssh",
	5: "5:chat",
	6: "6",
	7: "7",
	8: "8",
	9: "9",
	10: "10:game"
}

i3 = i3ipc.Connection()

def truncate_name(name):
	name = name.replace("&", "+")
	truncated = name[:40] + (name[40:] and '...')
	return filter(lambda x: x in set(string.printable), truncated)


def on_event(i3, e):
	if e.change in ['focus', 'title']:
		tree = i3.get_tree()
		window = tree.find_focused();
		if window != None:
			new_name = window.name
			workspace = window.workspace()
			
			if workspace != None:		
				current_num = workspace.num
				current_name = workspace.name
			
				for ws in tree.workspaces():
					current_name = ws.name					
					if ws.num != current_num:
						new_name = workspace_defaults[ws.num]
					else:	
						if window.name != None:
							new_name = "%d:%s" % (current_num, truncate_name(window.name))
						else:
							new_name = workspace_defaults[ws.num]
								
					i3.command("rename workspace \"%s\" to \"%s\"" % (current_name, new_name))
		
i3.on('workspace', on_event)
i3.on('window', on_event)

i3.main()
