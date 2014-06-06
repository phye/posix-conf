#!/bin/sh
PREFIX=''
CMD='s'
if [ "$1" == "2" ]; then
    PREFIX=$1
fi

if [ "$2" == "telnet" ]; then
    CMD='t'
fi

echo $CMD
tmux selectp -t 0
tmux splitw -h -p 50

tmux selectp -t 0
tmux splitw -v -p 50
tmux selectp -t 2
tmux splitw -v -p 50

tmux selectp -t 0 
#tmux send-keys "sats2" C-m
tmux send-keys "$CMD$PREFIX""cdsm" C-m
tmux selectp -t 1 
#tmux send-keys "sats2" C-m
tmux send-keys "$CMD$PREFIX""sr" C-m
tmux selectp -t 2 
#tmux send-keys "sats2" C-m
tmux send-keys "$CMD$PREFIX""se1" C-m
tmux selectp -t 3 
#tmux send-keys "sats2" C-m
tmux send-keys "$CMD$PREFIX""se2" C-m
