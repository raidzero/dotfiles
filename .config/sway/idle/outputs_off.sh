#!/bin/bash

# inhibited?
#~/.config/sway/idle/inhibitors/ac.sh || exit 1
~/.config/sway/idle/inhibitors/pulse.sh || exit 1

~/.config/sway/toggle_active_outputs.py idle
