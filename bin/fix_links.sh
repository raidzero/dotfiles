#!/bin/bash

BAD_LINKS=`ldd $1 | grep "not found" | cut -d ' ' -f1| sed 's/^[\t]*//g'`

for LN in `echo "${BAD_LINKS}"`; do
	NAME=`echo "$LN" | sed 's/\.so.*$/.so/'`

	echo "Attemtping to fix $LN version $NAME"

	if [ -e /usr/lib/$NAME ] && [ ! -e /usr/lib/$LN ]; then
		sudo ln -s /usr/lib/$NAME /usr/lib/$LN
	else
		echo "Could not create link. /usr/lib/$NAME does not exist."
	fi
done
