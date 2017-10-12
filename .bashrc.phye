# Aliases  ---
# Aliases should be moved to .shrc_phye as they can used by all shells

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
export log_on_pc="$HOME/bin/phye/logpc.sh"

if [ -f $HOME/.git-completion.bash ]; then
    source $HOME/.git-completion.bash
fi

if [ -f $HOME/.bashrc_phye_cisco ]; then
    source $HOME/.bashrc_phye_cisco
    #echo "Cisco Setting sourced ..."
else 
    if [ -f $HOME/.bashrc_phye_general ]; then
        source $HOME/.bashrc_phye_general
        #echo "General Setting sourced ..."
    fi
fi

# Source all common setups for bash/zsh
source ~/.shrc.phye
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
