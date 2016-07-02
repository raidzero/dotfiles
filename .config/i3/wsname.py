#!/usr/bin/env python
import i3ipc
import sys

name = sys.argv[1]

i3 = i3ipc.Connection()

# determnine current workspace
for ws in i3.get_workspaces():
	if ws['focused']:
		old_name = ws.name
		
		i3.command("rename workspace \"%s\" to \"%d:%s\"" % (old_name, ws.num, name))
