#!/bin/sh
SESSION=$1
tmux -2 new-session -d -s $SESSION

tmux -2 new-window -t $SESSION:1
tmux -2 new-window -t $SESSION:2
tmux -2 new-window -t $SESSION:3
tmux -2 new-window -t $SESSION:4
tmux -2 new-window -t $SESSION:5

tmux -2 select-window -t $SESSION:^
tmux -2 attach-session -t $SESSION
