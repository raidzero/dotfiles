#!/usr/bin/env python
import i3ipc
import os
import pickle
import sys

idleVerb = sys.argv[1]

savedLoc = "/tmp/sway_outputs.status"
savedOutputStatus = {}
if os.path.exists(savedLoc):
    with open(savedLoc, 'rb') as f:
        savedOutputStatus = pickle.load(f)

i3 = i3ipc.Connection()

def isOutputActive(outputName):
    active = len([ o for o in i3.get_outputs() if o['name'] == outputName and o['active'] ]) > 0
    return active

def turnActiveOutputsOff():
    for output in i3.get_outputs():
        # save active status for this output
        savedOutputStatus[output['name']] = output['active']

        if output['active']:
            # turn off
            print("Disabling output {}".format(output['name']))
            i3.command("output {} disable".format(output['name']))

    with open(savedLoc, 'wb') as f:
        pickle.dump(savedOutputStatus, f)


def turnPreviouslyActiveOutputsOn():
    for outputName, active in savedOutputStatus.items():
        if active:
            # turn on (if off)
            if not isOutputActive(outputName):
                print("Enabling output {}".format(outputName))
                i3.command("output {} enable".format(outputName))

if idleVerb == 'idle':
    turnActiveOutputsOff()
elif idleVerb == 'active':
    turnPreviouslyActiveOutputsOn()


