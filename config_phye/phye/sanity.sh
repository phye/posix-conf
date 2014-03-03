#!/bin/sh
PREFIX=''
if [ "$1" == "2" ]; then
    PREFIX=$1
fi

tmux selectp -t 0
tmux splitw -h -p 50

tmux selectp -t 0
tmux splitw -v -p 50
tmux selectp -t 2
tmux splitw -v -p 50

tmux selectp -t 0 
tmux send-keys "sats2" C-m
tmux send-keys "s$PREFIX""cdsm" C-m
tmux selectp -t 1 
tmux send-keys "sats2" C-m
tmux send-keys "s$PREFIX""sr" C-m
tmux selectp -t 2 
tmux send-keys "sats2" C-m
tmux send-keys "s$PREFIX""se1" C-m
tmux selectp -t 3 
tmux send-keys "sats2" C-m
tmux send-keys "s$PREFIX""se2" C-m
