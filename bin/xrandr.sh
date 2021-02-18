#!/bin/bash
# DVI-D-0, DP-1, DVI-I-1 (770)
# DP-4, DVI-D-0, DP-0

DISPLAYS=$(cat /tmp/randrmode) # can be jkl, any combination or blank

#OUTPUTS=$(echo -e "DP-1\nDVI-I-1\nDVI-D-0")
OUTPUTS=$(echo -e "DP-4\nDVI-D-0\nDP-0")

if [ -z "$DISPLAYS" ]; then
	xrandr --auto
else
	SELECTED_OUTPUTS=""

	if [[ "$DISPLAYS" == *j* ]]; then
		D=$(echo "$OUTPUTS" | head -n 1 | cut -d ' ' -f1)
		SELECTED_OUTPUTS="${SELECTED_OUTPUTS}\n$D"
		echo "selected left"
	fi

	if [[ "$DISPLAYS" == *k* ]]; then
		D=$(echo "$OUTPUTS" | head -n 2 | tail -n 1 | cut -d ' ' -f1)
		SELECTED_OUTPUTS="${SELECTED_OUTPUTS}\n$D"
		echo "selected center"
	fi

	if [[ "$DISPLAYS" == *l* ]]; then
		D=$(echo "$OUTPUTS" | tail -n 1 | cut -d ' ' -f1)
		SELECTED_OUTPUTS="${SELECTED_OUTPUTS}\n$D"
		echo "selected right"
	fi

	echo -e "SELECTED:\n$SELECTED_OUTPUTS"

	# build up an xrandr command to enable/disable outputs

	XRANDR_STR="xrandr "
	for OUTPUT in $(echo "$OUTPUTS"); do
		# selected?
		echo "checking for output $OUTPUT"
		if [ $(echo "$SELECTED_OUTPUTS" | grep "$OUTPUT") ]; then
			echo "$OUTPUT enabled"
			if [ -z "$PREV_OUTPUT" ] || [ "$PREV_OUTPUT_ENABLED" != "true" ]; then
				# first output in command
				XRANDR_STR="${XRANDR_STR} --output ${OUTPUT} --auto "
				PREV_OUTPUT_ENABLED="true"
			else
				# subsequent outputs, use --left-of
				XRANDR_STR="${XRANDR_STR} --output ${OUTPUT} --right-of ${PREV_OUTPUT} --auto "
			fi
		else
			echo "$OUTPUT disabled"
			XRANDR_STR="${XRANDR_STR} --output ${OUTPUT} --off "
		fi
		PREV_OUTPUT="$OUTPUT"
	done

	echo $XRANDR_STR
	$XRANDR_STR # execute it
	rm /tmp/randrmode # remove display file
fi


sh ~/.fehbg
~/.config/i3/polybar.sh
