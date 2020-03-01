# Functions ---
#tmux-window-name()
#{
#    if [ "$PWD" != "$LPWD" ]; then
#        LPWD="$PWD";
#        tmux rename-window ${PWD//*\//};
#    fi;
#};

# Exports --- 
# Enable this only if tmux is needed
#export PROMPT_COMMAND=tmux-window-name
export PS1='\[\e[0;33m\]\u\[\e[0m\]@\[\e[0;32m\]\h\[\e[0m\]:\[\e[0;35m\]\W\[\e[0m\]\$'

if [ -f $HOME/.git-completion.bash ]; then
    source $HOME/.git-completion.bash
fi

[ -f /usr/share/fzf/key-bindings.bash ] && source /usr/share/fzf/key-bindings.bash
[ -f /usr/share/fzf/completion.bash ] && source /usr/share/fzf/completion.bash
[ -f ~/.shrc.phye.sh ] && source ~/.shrc.phye.sh
