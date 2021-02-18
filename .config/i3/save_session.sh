#!/bin/bash
LAYOUT_DIR=~/.config/i3/layout

[ -d "$LAYOUT_DIR" ] && rm -rf "$LAYOUT_DIR"
mkdir "$LAYOUT_DIR"

WORKSPACES=$(i3-msg -t get_workspaces | jq '.[] .name')

echo "$WORKSPACES" > "$LAYOUT_DIR/ws.names"

WS_NUM=0
for WS in $(echo "$WORKSPACES"); do
	let WS_NUM+=1
	OUTPUT=$LAYOUT_DIR/$WS_NUM.layout
	echo "saving layout on workspace $WS to $OUTPUT"
	i3-save-tree --workspace $WS | sed -E 's_^[[:blank:]]*//( ?[a-z:=0-9_ ]+)?__g' >> $OUTPUT
	SIZE=$(wc -c < $OUTPUT)

	echo "saved $SIZE bytes"

done
