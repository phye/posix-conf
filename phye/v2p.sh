#!/bin/sh
SESSION=$1
V2PC_ROOT=/ws/v2p-master
SCO_ROOT=~/ws/scos

cd $SCO_ROOT
tmux -2 new-session -d -s $SESSION
tmux -2 rename-window -t $SESSION:0 'sco' 

tmux -2 new-window -t $SESSION:1 -n 'v2p' -c $V2PC_ROOT
tmux -2 new-window -t $SESSION:2 -n 'v2p' -c $V2PC_ROOT
tmux -2 new-window -t $SESSION:3 -n 'v2p' -c $V2PC_ROOT
tmux -2 new-window -t $SESSION:4 -n 'v2p' -c $V2PC_ROOT

tmux -2 select-window -t $SESSION:0 
tmux -2 attach-session -t $SESSION
