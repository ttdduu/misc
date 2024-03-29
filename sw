#!/bin/bash

NODE_CURRENT=$(bspc query -N -n focused)
$@ &
PID_COMMAND=$!
WATCH=$(bspc subscribe -c 1 node_add)
NODE_NEW=${WATCH%% *}
bspc node -s $NODE_CURRENT
bspc node $NODE_CURRENT --flag hidden=on
wait $PID_COMMAND
bspc node $NODE_CURRENT --flag hidden=off
bspc node $NODE_CURRENT --focus
