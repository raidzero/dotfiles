#!/bin/bash
echo "MEM: `free -m | grep "^Mem:" | awk '{printf("%2.0f%%", (($2-$7)/$2)*100)}'` |"
