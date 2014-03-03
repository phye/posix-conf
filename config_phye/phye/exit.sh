#!/bin/bash
panes=$((`tmux list-panes| wc -l`))

while [ $panes -lt 1 ]; do
    tmux kill-pane -t 0
    panes=$((`tmux list-panes| wc -l`))
done
