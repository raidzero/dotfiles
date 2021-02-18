#!/bin/bash

current=`grep remaining /proc/acpi/battery/BAT0/state | tr -d A-z | tr -d " " | tr -d :`

total=`grep "design capacity:" /proc/acpi/battery/BAT0/info | tr -d A-z | tr -d " " | tr -d :`

rate=`grep "present rate:" /proc/acpi/battery/BAT0/state | tr -d A-z | tr -d " " | tr -d :`

percent=`bc << EOF
100.0 * $current / $total
EOF

if [ $rate -eq  0 ]; then
  echo $percent'%, charging'
else
hours=`bc << EOF
(1.0*$current) / (1.0*$rate)
EOF

minutes=`bc << EOF
60.0 * $current / $rate - $hours * 60
EOF

echo $percent'%, '$hours':'$minutes
fi
