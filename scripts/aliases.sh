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
        alias grep="grep -I"
    fi
    alias ll="ls -al"
    alias grep="grep -I"
    alias cmake='cmake3'
    alias dh='dirs -v'
    # }}}
}

function set_tmux_alias() {
    # Tmux Alias {{{
    alias tmuxn="tmux -2 new-session -s"
    alias tmuxa="tmux -2 attach-session -t"
    alias tfp="tmux_find_pts"
    alias tfc="tmux_find_command"
    alias tfph="tmux_find_path"
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
    alias ec='emacsclient -nw --socket=$(tmux_get_session_name)'
    # }}}
}

function set_git_alias() {
    # Git Alias {{{
    alias gs='git status'
    # }}}
}

function set_misc_alias() {
    :
}

function set_alias() {
    set_core_util_alias
    set_tmux_alias
    set_curl_alias
    set_emacs_alias
    set_git_alias
    set_misc_alias
}

set_alias