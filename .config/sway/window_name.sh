swaymsg -t get_tree | jq '.. | (.nodes? // empty)[] | select(.focused==true) | {name, pid}' | jq '.name'
