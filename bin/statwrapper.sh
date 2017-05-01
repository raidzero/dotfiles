#!/bin/sh

cat /proc/stat | grep "^cpu" | awk '{print $1 " USER: " $2 " NICE: " $3 " SYS: " $4 " IDLE: " $5 " IOWAIT: " $6 " IRQ: " $7 " SOFTIRQ: " $8 " STEAL: " $9}'
