function set_core_util_alias() {
    # Common utils {{{
    if [[ "$OSTYPE" == "darwin"* ]]; then
        alias lnd="ln -sn"
        alias lnf="ln -s"
        alias ls="ls -G"
        alias grep="grep -i"
    else
        alias lnd="ln -sTb"
        alias lnf="ln -sb"
        alias ls="ls --color"
        alias grep="grep -I -i"
    fi
    alias ll="ls -al"
    alias grep="grep -I"
    #alias cmake='cmake3'
    alias dh='dirs -v'
    # }}}
}

function set_tmux_alias() {
    # Tmux Alias {{{
    alias tn="tmux -2 new-session -s"
    alias ta="tmux -2 attach-session -t"
    alias tfp="tmux_find_pts"
    alias tfc="tmux_find_command"
    alias tfph="tmux_find_path"
    alias s3="tmux split-window -h -l 66% \; split-window -h -l 50%"
    alias s4="tmux split-window -h \; split-window -v \; split-window -v -t {left-of} \; select-pane -t {top-left}"
    # }}}
}

function set_curl_alias() {
    # Curl Aliases {{{
    alias post='curl -kv -X POST -H"Content-Type: application/json"'
    alias put='curl -kv -X PUT -H"Content-Type: application/json"'
    alias get='curl -kv -X GET'
    alias delete='curl -kv -X DELETE'
    # }}}
}

function set_emacs_alias() {
    # Emacs Utils {{{
    alias emacs="LC_CTYPE=zh_CN.UTF-8 emacs"
    alias ed='emacs --daemon=$(tmux_get_session_name)'
    #alias ed='emacs --daemon'
    alias ec='emacsclient -nw --socket=$(tmux_get_session_name)'
    #alias ec='emacsclient -nw'
    alias ecf='ec $(fzf)'
    # }}}
}

function ediff() {
	if [ "X${2}" = "X" ]; then
		echo "USAGE: ediff <FILE 1> <FILE 2>"
	else
		# The --eval flag takes lisp code and evaluates it with EMACS
		emacsclient -nw --socket=$(tmux_get_session_name) --eval "(ediff-files \"$1\" \"$2\")"
	fi
}

function set_git_alias() {
    # Git Alias {{{
    alias gs='git status'
    # }}}
}

function set_misc_alias() {
    :
}

function set_k8s_alias() {
    alias kctx="kubectx"
    alias kd="kubectl describe"
    alias kg="kubectl get"
    alias ke="kubectl edit"
    alias kga="kubectl get -A"
    alias kgw="kubectl get -o wide"
    alias kgy="kubectl get -o yaml"
    alias kgj="kubectl get -o json"
}

function set_alias() {
    set_core_util_alias
    set_tmux_alias
    set_curl_alias
    set_emacs_alias
    set_git_alias
    set_misc_alias
    set_k8s_alias
}

set_alias
