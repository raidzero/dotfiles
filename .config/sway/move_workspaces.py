#!/usr/bin/env python
import i3ipc
import sys
import time

OUTPUT=sys.argv[1]

if OUTPUT.startswith('e'):
    OTHER_OUTPUT = 'DP-1'
else:
    OTHER_OUTPUT = 'eDP-1'

i3 = i3ipc.Connection()

# get current ws name so we can switch back to it afterwards
activews = [ws.name for ws in i3.get_workspaces() if ws.focused][0]
i3.command("output %s enable" % OUTPUT)

for ws in i3.get_workspaces():
    i3.command("workspace %s" % ws.name)
    i3.command("move workspace to output %s" % OUTPUT)

i3.command("workspace %s" % activews)

time.sleep(1)
i3.command("output %s disable" % OTHER_OUTPUT)
