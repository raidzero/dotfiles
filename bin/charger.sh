#!/bin/bash

if [ -z "$1" ]; then
	echo "USAGE: $(basename "$0") [connected|disconnected]"
	exit 1
fi

STATUS=$1
echo "$(date) ${STATUS}" >> /home/raidzero/.ac.log
