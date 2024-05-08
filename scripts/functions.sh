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

function print_chinese() {
    tmp=$(echo "$1" | sed 's/\\/\\0/g')
    echo -e "$tmp"
}

# from: https://github.com/davidshepherd7/emacs-read-stdin/tree/master
# include this file in your .bashrc/.zshrc with source "emacs-pipe.sh"

# The emacs or emacsclient to use
function _emacsfun()
{
    # Replace with `emacs` to not run as server/client
    emacsclient -c -t --socket=$(tmux_get_session_name) "$@"
}


# An emacs 'alias' with the ability to read from stdin
function e() {
    # If the argument is - then write stdin to a tempfile and open the
    # tempfile.
    if [ $# -ge 1 ] && [ "$1" = - ]; then
        shift
        tempfile="$(mktemp "emacs-stdin-$USER.XXXXXXX" --tmpdir)"
        cat - > "$tempfile"
        _emacsfun --eval "(find-file \"$tempfile\")" \
                  --eval '(set-visited-file-name nil)' \
                  --eval '(rename-buffer "*stdin*" t))' \
                  "$@"
    else
        _emacsfun "$@"
    fi
}

function y() {
    # If the argument is - then write stdin to a tempfile and open the
    # tempfile.
    if [ $# -ge 1 ] && [ "$1" = - ]; then
        shift
        tempfile="$(mktemp "emacs-stdin-$USER.XXXXXXX" --tmpdir)"
        cat - > "$tempfile"
        _emacsfun --eval "(find-file \"$tempfile\")" \
                  --eval '(set-visited-file-name nil)' \
                  --eval '(rename-buffer "*stdin*" t))' \
                  --eval '(yaml-mode)'
                  "$@"
    else
        _emacsfun "$@"
    fi
}

function j() {
    # If the argument is - then write stdin to a tempfile and open the
    # tempfile.
    if [ $# -ge 1 ] && [ "$1" = - ]; then
        shift
        tempfile="$(mktemp "emacs-stdin-$USER.XXXXXXX" --tmpdir)"
        cat - > "$tempfile"
        _emacsfun --eval "(find-file \"$tempfile\")" \
                  --eval '(set-visited-file-name nil)' \
                  --eval '(rename-buffer "*stdin*" t))' \
                  --eval '(json-mode)'
                  "$@"
    else
        _emacsfun "$@"
    fi
}

function ediff() {
	if [ "X${2}" = "X" ]; then
		echo "USAGE: ediff <FILE 1> <FILE 2>"
	else
		# The --eval flag takes lisp code and evaluates it with EMACS
		emacsclient -nw --socket=$(tmux_get_session_name) --eval "(ediff-files \"$1\" \"$2\")"
	fi
}

function kjj () {
    kubectl get "$@" -o json | j -
}

function kyy () {
    kubectl get "$@" -o yaml | y -
}

function kdy () {
    kubectl describe "$@" | y -
}

function kexec () {
    kubectl exec -n kube-system "$@" -it bash
}

# This is no longer needed
# function setup_kubectl_config() {
#     KUBECONFIG=""
#     cfgdir=$1
#     if [ -z $cfgdir ]; then
#         cfgdir="$HOME/.kube/configs"
#     fi
#     if [ ! -e $cfgdir ]; then
#         return
#     fi
#     for f in $cfgdir/*.yaml; do
#         KUBECONFIG=$f:$KUBECONFIG
#     done
#     export KUBECONFIG
# }

# setup_kubectl_config

# }}}
