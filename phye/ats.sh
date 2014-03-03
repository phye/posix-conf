#!/bin/sh
SESSION=$1
tmux new-session -d -s $SESSION

tmux new-window -t $SESSION:1 -n 'bash' 'ssh sha-iptv-ats2 -t 'bash''
tmux new-window -t $SESSION:2 -n 'ATS' 'ssh sha-iptv-ats2 -t 'bash''
tmux new-window -t $SESSION:3 -n 'SE1' 'ssh sha-iptv-ats2 -t 'bash''
tmux new-window -t $SESSION:4 -n 'SE2' 'ssh sha-iptv-ats2 -t 'bash''
tmux new-window -t $SESSION:5 -n 'SE3' 'ssh sha-iptv-ats2 -t 'bash''

tmux select-window -t $SESSION:0
tmux attach-session -t $SESSION
