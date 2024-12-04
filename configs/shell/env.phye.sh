# ENVs {{{
[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"
[ -f "$HOME/.var.sh" ] && source "$HOME/.var.sh"

export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LANG=en_US.UTF-8

export EDITOR="emacsclient -a ''"

export SCRIPTS=${HOME}/bin/scripts
export GOPATH=~/ws/go
export PATH="$HOME/bin/scripts:$HOME/bin:$HOME/.fzf/bin:$HOME/.local/bin:$GOPATH/bin:$HOME/.cargo/bin:/usr/local/go/bin:/usr/local/bin:/opt/homebrew/bin:/snap/bin:/usr/local/opt/fzf/bin:/usr/local/opt/llvm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/TeX/texbin:/Library/Apple/usr/bin"
export LD_LIBRARY_PATH="/usr/local/lib"
export MANPATH=":/usr/local/share/man"
export LESS="-R"
export INFOPATH="/opt/homebrew/share/info:/usr/local/share/info${INFOPATH:+:${INFOPATH}}"
# to make custom widgets loadable before compinit
export fpath=(${MY_ZSH_DIR}/widgets $fpath)

# hidpi support
# qt 5
export QT_AUTO_SCREEN_SCALE_FACTOR=1
# gtk 3
# export GDK_SCALE=2
# export GDK_DPI_SCALE=0.5
# }}}

# disable path unify
# PATH="$(perl -e 'print join(":", grep { not $seen{$_}++ } split(/:/, $ENV{PATH}))')"
