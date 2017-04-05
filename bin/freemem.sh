#!/bin/bash
free -m | grep "^Mem:" | awk '{printf("%2.0f%%\n", (($2-$7)/$2)*100)}'
