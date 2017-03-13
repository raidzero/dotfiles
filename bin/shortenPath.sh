#!/bin/bash
# shortens a path like vim airline 

DISP=$1
SHORTENED=$DISP

if [[ $DISP =~ ^$HOME ]]; then 
	SHORTENED=`echo "$SHORTENED" | sed 's_'"$HOME"'_~_'`
	
fi

LEN=`echo "$SHORTENED" | wc -c`

if [ "$LEN" -ge 25 ]; then
	SHORTENED=`echo "$SHORTENED" | sed 's_/\(.\)[^/]*_/\1_g'`
	SHORTENED=${SHORTENED::-1}
	SHORTENED="$SHORTENED`basename $DISP`"
fi

# print in red if not in a writable path
if [ ! -w $DISP ]; then
	echo -e "\033[1;31m${SHORTENED}"
else	
	echo $SHORTENED
fi
