# Functions {{{

# Common Functions
function is_a_mac() {
    if [[ "$OSTYPE" == "darwin"* ]]; then
        # 1 for true
        return 1
    else
        # 0 for false
        return 0
    fi
}

function v () {
    vim -c ScratchBuffer -
}

function mpd() {
    curl $1 | xmlformat | v
}

# Tmux Functions
function tmux_get_session_name() {
    result=$(tmux display-message -p '#S')
    echo $result
}

function tmux_find_pts() {
    result=$(tmux list-panes -a -F 'S: #S, W: #I, P: #P #{pane_tty}' | grep "/dev/pts/$1")
    echo $result
}

function tmux_find_command() {
    result=$(tmux list-panes -a -F 'S: #S, W: #I, P: #P #{pane_current_command}' | grep "$1")
    echo $result
}

function tmux_find_path() {
    result=$(tmux list-panes -a -F 'S: #S, W: #I, P: #P #{pane_current_path}' | grep "$1")
    echo $result
}

function unset_proxy() {
    unset http_proxy
    unset https_proxy
    unset no_proxy
}

function edit() {
    if [ -z "$1" ]
    then
        TMP="$(mktemp /tmp/stdin-XXX)"
        cat >$TMP
        emacsclient -a emacs $TMP
        rm $TMP
    else
        emacsclient -a emacs "$@"
    fi
}

function get_zsh_path() {
    ret="/usr/bin/zsh"
    if [ -f "/usr/local/bin/zsh" ]; then
        ret="/usr/local/bin/zsh"
    fi
    echo $ret
}

function print_chinese() {
    tmp=$(echo "$1" | sed 's/\\/\\0/g')
    echo -e "$tmp"
}

source emacs.read.stdin.sh

function kjj () {
    kubectl get "$@" -o json | j -
}

function kyy () {
    kubectl get "$@" -o yaml | y -
}

function kdy () {
    kubectl describe "$@" | y -
}

# }}}
