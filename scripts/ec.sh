#!/bin/bash
# Wrapper for emacsclient to reset terminal settings with stty

# Run emacsclient with provided arguments
SOCKET=$(tmux display-message -p "#S")
# Pre-load magit so git-commit-mode activates via auto-mode-alist
emacsclient --socket="$SOCKET" --eval "(require 'magit)" -a '' 2>/dev/null
# Open file as a proper server file so emacsclient waits and C-c C-k works
emacsclient -nw --socket="$SOCKET" "$@"
exit_code=$?

# Check if emacsclient exited with non-zero status
if [ $exit_code -ne 0 ]; then
    # Reset terminal settings
    stty sane
fi

# Return the exit code of emacsclient
exit $exit_code