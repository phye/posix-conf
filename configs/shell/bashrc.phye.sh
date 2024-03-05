function load_if_exist () {
    [ -f $1 ] && source $1
}

load_if_exist $HOME/.git-completion.bash
load_if_exist $HOME/.fzf.bash
load_if_exist $HOME/.env.phye.sh
load_if_exist $HOME/.shrc.phye.sh