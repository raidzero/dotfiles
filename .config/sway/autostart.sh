#!/bin/bash

xrdb -merge ~/.Xresources &

urxvtd &

libinput-gestures-setup start &
