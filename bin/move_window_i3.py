#!/usr/bin/env python
import sys
import i3ipc

TYPE = sys.argv[1]
CMD = sys.argv[2]
BAR_TOP = 0

i3 = i3ipc.Connection()

MONITOR_DIMENS = [(ws.rect.width, ws.rect.height) for ws in i3.get_workspaces() if ws.focused][0]
WINDOW_DIMENS = [(leaf.rect.width, leaf.rect.height) for leaf in i3.get_tree() if leaf.focused][0]

MON_WIDTH = MONITOR_DIMENS[0]
MON_HEIGHT = MONITOR_DIMENS[1]

WIN_WIDTH = WINDOW_DIMENS[0]
WIN_HEIGHT = WINDOW_DIMENS[1]

def move(x, y):
    i3.command("move position %d %d" % (x, y))

def resize(w, h):
    i3.command("resize set %d %d" % (w, h))

def divvy(x, y, w, h):
    resize(w, h)
    move(x, y)


if TYPE == 'teleport':
    if CMD == 'top-left':
        move(0, BAR_TOP)
    elif CMD == 'bottom-left':
        move(0, (MON_HEIGHT - WIN_HEIGHT))
    elif CMD == 'top-right':
        move((MON_WIDTH - WIN_WIDTH), BAR_TOP)
    elif CMD == 'bottom-right':
        move((MON_WIDTH - WIN_WIDTH), (MON_HEIGHT - WIN_HEIGHT))
    elif CMD == 'center':
        move((MON_WIDTH / 2) - WIN_WIDTH / 2, (MON_HEIGHT / 2) - WIN_HEIGHT / 2)

if TYPE == 'divvy':
    if CMD == 'half-left':
        divvy(0, 0, MON_WIDTH / 2, MON_HEIGHT)
    elif CMD == 'half-right':
        divvy(MON_WIDTH / 2, 0, MON_WIDTH / 2, MON_HEIGHT)
    elif CMD == 'third-left':
        divvy(0, 0, MON_WIDTH / 3, MON_HEIGHT)
    elif CMD == 'third-middle':
        divvy(MON_WIDTH / 3, 0, MON_WIDTH / 3, MON_HEIGHT)
    elif CMD == 'third-right':
        divvy(MON_WIDTH - MON_WIDTH / 3, 0, MON_WIDTH / 3, MON_HEIGHT)
    elif CMD == 'two-thirds-left':
        divvy(0, 0, (MON_WIDTH / 3) * 2, MON_HEIGHT)
    elif CMD == 'two-thirds-right':
        divvy(MON_WIDTH / 3, 0, (MON_WIDTH / 3) * 2, MON_HEIGHT)
    elif CMD == 'quarter-top-left':
        divvy(0, 0, MON_WIDTH / 2, MON_HEIGHT / 2)
    elif CMD == 'quarter-top-right':
        divvy(MON_WIDTH / 2, 0, MON_WIDTH / 2, MON_HEIGHT / 2)
    elif CMD == 'quarter-bottom-left':
        divvy(0, MON_HEIGHT / 2, MON_WIDTH / 2, MON_HEIGHT / 2)
    elif CMD == 'quarter-bottom-right':
        divvy(MON_WIDTH / 2, MON_HEIGHT / 2, MON_WIDTH / 2, MON_HEIGHT / 2)
    elif CMD == 'half-top':
        divvy(0, 0, MON_WIDTH, MON_HEIGHT / 2)
    elif CMD == 'half-bottom':
        divvy(0, MON_HEIGHT / 2, MON_WIDTH, MON_HEIGHT / 2)
