#!/bin/sh
SESSION=$1
tmux -2 new-session -d -s $SESSION

tmux -2 new-window -t $SESSION:1 -n 'src' 
tmux -2 new-window -t $SESSION:2 -n 'aux' 
tmux -2 new-window -t $SESSION:3 -n 'checkin'
tmux -2 new-window -t $SESSION:4 -n 'aux2'
tmux -2 new-window -t $SESSION:5 -n 'ATS' 

tmux -2 select-window -t $SESSION:^
tmux -2 attach-session -t $SESSION
