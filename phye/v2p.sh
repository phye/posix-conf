#!/bin/sh
SESSION=$1
V2PC_ROOT=/ws/v2p-master
SCO_ROOT=~/ws/scos

tmux has-session -t shared 2>/dev/null
if [[ $? != 0 ]]; then
    tmux -2 new-session -d -s 'shared' -n 'sco' -c $SCO_ROOT 
    tmux -2 detach-client -s 'shared'
else
    echo "shared session already exist"
fi

cd $V2PC_ROOT
tmux -2 new-session -d -s $SESSION -c $V2PC_ROOT
tmux -2 new-window -t $SESSION:1 
tmux -2 new-window -t $SESSION:2 
tmux -2 new-window -t $SESSION:3 
tmux -2 new-window -t $SESSION:4 
tmux -2 link-window -d -s shared:sco -t 5

tmux -2 select-window -t $SESSION:0
tmux -2 attach-session -d -t $SESSION
