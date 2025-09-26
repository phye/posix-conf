#!/bin/bash
# Wrapper for emacsclient to reset terminal settings with stty

# Run emacsclient with provided arguments
emacsclient -nw --socket=$(tmux display-message -p "#S") "$@"
exit_code=$?

# Check if emacsclient exited with non-zero status
if [ $exit_code -ne 0 ]; then
    # Reset terminal settings
    stty sane
fi

# Return the exit code of emacsclient
exit $exit_code