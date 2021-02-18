#!/bin/bash
HIST_DIR=~/.cache/i3/hist
[ ! -d "$HIST_DIR" ] && mkdir -p "$HIST_DIR"

if (( $# == 0 )); then
	read DATA # assume data has been piped in
	PROGRAM_NAME=$(echo "$DATA" | cut -d ' ' -f1)
else
	DATA="$@"
	PROGRAM_NAME="$1"
fi

# do we already have one of these running?
INST_NUM=1
if [ -e "$HIST_DIR"/"$PROGRAM_NAME"-* ]; then
	INST_NUM=$(ls "$HIST_DIR/$PROGRAM_NAME-*" | tail -n 1 | grep -oE "[0-9]+$")
	(( INST_NUM++ ))
fi

echo "$DATA" > "$HIST_DIR"/"$PROGRAM_NAME-$INST_NUM"
eval "$DATA" && rm "$HIST_DIR"/"$PROGRAM_NAME-$INST_NUM"
