#!/bin/bash
# launches X on egpu, if present, or igpu if not

EGPU_PRESENT=`lspci | grep -i nvidia`

if [ -n "$EGPU_PRESENT" ]; then
	startx -- -config nvidia/xorg.nvidia.conf
else
	startx
fi
