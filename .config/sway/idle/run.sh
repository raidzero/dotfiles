#!/bin/bash

DIM_TIMEOUT=60 # one minute
let LOCK_TIMEOUT=$DIM_TIMEOUT+120
let DPMS_TIMEOUT=$LOCK_TIMEOUT+60
let SUSPEND_TIMEOUT=$DPMS_TIMEOUT+60

IDLE=~/.config/sway/idle


swayidle \
    timeout $DIM_TIMEOUT    "$IDLE/dim_screen.sh" \
        resume  "$IDLE/brighten_screen.sh" \
    timeout $LOCK_TIMEOUT   "$IDLE/lock.sh" \
    timeout $DPMS_TIMEOUT   "$IDLE/outputs_off.sh" \
        resume "$IDLE/outputs_on.sh" \
    timeout $SUSPEND_TIMEOUT "$IDLE/suspend.sh"
