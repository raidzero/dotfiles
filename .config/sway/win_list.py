#!/usr/bin/python
import i3ipc
import json
import sys
import threading
import time
import select

winColor = '#ffffff'
focusedColor = '#00ffff'
max_name_len = 100

def print_line(message):
    line = message + '\n'

    sys.stdout.write(line)
    sys.stdout.flush()

def read_stdin():
    i3 = i3ipc.Connection()

    while True:
        line = sys.stdin.readline()
        #with open('/tmp/log', 'a+') as f:
        #    f.write("read: %s" % line)

        try:
            if line.startswith(','):
                line = line[1:]

            data = json.loads(line)
            if data['instance'] != None:
                if data['button'] == 1:
                    # turn on mouse warping so the mouse jumps into the window that was just clicked
                    #i3.command('mouse_warping container')
                    i3.command('[con_id=%s] focus' % data['instance'])
                    i3.command('raise')
                    # turn it back off
                    #i3.command('mouse_warping none')
                elif data['button'] == 3: # right click
                    i3.command('[con_id=%s] kill' % data['instance'])


        except Exception as e:
            pass
            #with open('/tmp/log', 'a+') as f:
            #    f.write("exception occurred: " + str(e) + '\n')

def getColor(focused):
    if focused:
        return focusedColor
    else:
        return winColor

def getWindows(i3):
    focusedWorkspaces = [ ws for ws in i3.get_workspaces() if ws.focused ]
    if len(focusedWorkspaces) == 0:
        # abort if the workspace cannot be found
        # not sure how this happens but it does
        return None

    currentWs = focusedWorkspaces[0]

    windows = [ (leaf.name, leaf.focused, leaf.id) for leaf in i3.get_tree() if (leaf.type == 'con' or leaf.type == 'floating_con') and leaf.workspace().num == currentWs.num and leaf.name != None ]

    return windows

def printWindows(i3, event):
    windows = getWindows(i3)

    if windows is None:
        return

    data = []

    for i, w in enumerate(windows):
        win_name = w[0]

        if len(win_name) > max_name_len:
            start = int(max_name_len / 2)
            end = len(win_name) - int(max_name_len / 2)
            win_name = win_name[:start] + "..." + win_name[end:]

        d = {
                'full_text' : " %s " % win_name,
                'color' : getColor(w[1]),
                'separator' : True,
                'instance' : w[2],
                'name' : w[2]
            }
        d['separator'] = i < len(windows) - 1

        data.append(d)

    print_line("," + json.dumps(data))



header = { 'version' : 1, 'click_events' : True }
print_line(json.dumps(header))
print_line("[")
print_line("[]")

def listenForEvents():

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
