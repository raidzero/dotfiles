#!/bin/bash
# shortens a path like vim airline 

DISP=$1
LENGTH=$2

SHORTENED=$DISP

if [[ $SHORTENED =~ ^$HOME ]]; then 
	SHORTENED=`echo "$SHORTENED" | sed 's_'"$HOME"'_~_'`
fi

LEN=`echo "$SHORTENED" | wc -c`

if [ "$LEN" -ge $LENGTH ]; then
	SHORTENED=`echo "$SHORTENED" | sed 's_/\(.\)[^/]*_/\1_g'`
	SHORTENED=${SHORTENED::-1}
	SHORTENED="$SHORTENED`echo $DISP | awk -F '/' '{print$NF}'`"
fi

# print in red if not in a writable path
if [ ! -w "$DISP" ]; then
	echo -e "\033[1;31m${SHORTENED}"
else	
	echo $SHORTENED
fi
