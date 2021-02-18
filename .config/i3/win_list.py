#!/usr/bin/python
import i3ipc
import json
import sys
import threading
import time
import select

winColor = '#ffffff'
focusedColor = '#00ffff'

def print_line(message):
    line = message + '\n'

    #with open('/tmp/log', 'a+') as f:
    #    f.write("wrote: %s" % line)

    sys.stdout.write(line)
    sys.stdout.flush()

def read_stdin():
    i3 = i3ipc.Connection()

    while True:
        with open('/tmp/log', 'a+') as f:
            f.write('running... %s\n' % str(time.time()))

        line = sys.stdin.readline()

        try:
            if line.startswith(','):
                line = line[1:]

            with open('/tmp/log', 'a+') as f:
                f.write('read: ' + line + '\n')

            data = json.loads(line)
            if data['instance'] != None:
                i3.command('[con_id=%s] focus' % data['instance'])

        except Exception as e:
            with open('/tmp/log', 'a+') as f:
                f.write("exception occurred: " + str(e) + '\n')

def getColor(focused):
    if focused:
        return focusedColor
    else:
        return winColor

def getWindows(i3):
    currentWs = [ ws for ws in i3.get_workspaces() if ws.focused ][0]

    windows = [ (leaf.name, leaf.focused, leaf.id) for leaf in i3.get_tree().leaves() if (leaf.type == 'con' or leaf.type == 'floating_con') and leaf.workspace().num == currentWs.num and leaf.name != None ]

    return windows

def printWindows(i3, event):
    windows = getWindows(i3)

    data = []

    for i, w in enumerate(windows):
        d = {
                'full_text' : " %s " % w[0],
                'color' : getColor(w[1]),
                'separator' : True,
                'instance' : w[2],
                'name': w[2]
            }
        d['separator'] = i < len(windows) - 1

        data.append(d)

    print_line("," + json.dumps(data))

def listenForEvents():
    header = { 'version' : 2, 'click_events' : True }
    print_line(json.dumps(header))
    print_line("[")
    print_line("[]")

    sess = i3ipc.Connection()
    printWindows(sess, None)

    sess.on('workspace', printWindows)
    sess.on('window', printWindows)

    sess.main()

# kick off background thread to listen to i3
t = threading.Thread(target = listenForEvents, args = ())
t.start()

# loop to listen to stdin
read_stdin()

with open('/tmp/log', 'a+') as f:
    f.write('end of program\n')
