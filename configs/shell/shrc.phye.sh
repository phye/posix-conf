# Common utils {{{
alias ls="ls --color"
alias ll="ls -al"
alias grep="grep -I"
alias cmake='cmake3'
alias dh='dirs -v'
# }}}

# Tmux Alias {{{
alias tmuxn="tmux -2 new-session -s"
alias tmuxa="tmux -2 attach-session -t"
# }}}

# Curl Aliases {{{
alias post='curl -kv -X POST -H"Content-Type: application/json"'
alias put='curl -kv -X PUT -H"Content-Type: application/json"'
alias get='curl -kv -X GET'
alias delete='curl -kv -X DELETE'
# }}}

# Emacs Utils {{{
alias emacs="LC_CTYPE=zh_CN.UTF-8 emacs"
alias ed="emacs --daemon=$(tmux display-message -p '#S')"
alias ec="emacsclient -nw --socket=$(tmux display-message -p '#S')"
# }}}

# Git Alias {{{
alias gs='git status'
# }}}

# ENVs {{{
export PATH="$HOME/bin/phye:$HOME/bin/sanity:$HOME/bin:$PATH"
export EDITOR='vim'
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export GOPATH=~/ws/go
export PATH=$PATH:$GOPATH/bin
# }}}

PATH="$(perl -e 'print join(":", grep { not $seen{$_}++ } split(/:/, $ENV{PATH}))')"

# Functions {{{

# Common Functions
function v () {
    vim -c ScratchBuffer -
}

function mpd() {
    curl $1 | xmlformat | v
}

# Tmux Functions
function tmux_find_pts() {
    result=$(tmux list-panes -a -F 'S: #S, W: #W, P: #P #{pane_tty}' | grep "/dev/pts/$1")
    echo $result
}

function tmux_find_command() {
    result=$(tmux list-panes -a -F 'S: #S, W: #W, P: #P #{pane_current_command}' | grep "$1")
    echo $result
}

function tmux_find_path() {
    result=$(tmux list-panes -a -F 'S: #S, W: #W, P: #P #{pane_current_path}' | grep "$1")
    echo $result
}
# }}}