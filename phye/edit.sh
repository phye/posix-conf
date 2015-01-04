#!/bin/sh
SESSION=$1
tmux new-session -d -s $SESSION

tmux new-window -t $SESSION:1 -n 'src' 
tmux new-window -t $SESSION:2 -n 'aux' 
tmux new-window -t $SESSION:3 -n 'checkin'
tmux new-window -t $SESSION:4 -n 'aux2'
tmux new-window -t $SESSION:5 -n 'ATS' 

tmux select-window -t $SESSION:0
tmux attach-session -t $SESSION
