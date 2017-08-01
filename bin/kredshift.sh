#!/bin/bash

killall redshift
pgrep redshift &> /dev/null || echo `date` > ~/.redshift.log && redshift -v -c ~/.config/redshift.conf &>> ~/.redshift.log &
