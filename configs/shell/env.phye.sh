# ENVs {{{
export SCRIPTS=${HOME}/bin/scripts
export EDITOR="emacsclient -nw -a ''"
export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LANG=en_US.UTF-8
export GOPATH=~/ws/go
export PATH="$HOME/bin/scripts:$HOME/bin:$HOME/.fzf/bin:$HOME/.local/bin:$GOPATH/bin:$HOME/.cargo/bin:/usr/local/go/bin:/usr/local/bin:/opt/homebrew/bin:/snap/bin:/usr/local/opt/fzf/bin:/usr/local/opt/llvm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/TeX/texbin:/Library/Apple/usr/bin"
export LD_LIBRARY_PATH="/usr/local/lib:/opt/rh/devtoolset-9/root/usr/lib64/"
export MANPATH=":/usr/local/share/man"
export LESS="-R"
export INFOPATH="/opt/homebrew/share/info:/usr/local/share/info${INFOPATH:+:${INFOPATH}}"

# hidpi support
# qt 5
export QT_AUTO_SCREEN_SCALE_FACTOR=1
# gtk 3
# export GDK_SCALE=2
# export GDK_DPI_SCALE=0.5
# }}}

# disable path unify
# PATH="$(perl -e 'print join(":", grep { not $seen{$_}++ } split(/:/, $ENV{PATH}))')"
function get_zsh_path() {
    ret="/usr/bin/zsh"
    if [ -f "/opt/homebrew/bin/zsh" ]; then
        ret="/opt/homebrew/bin/zsh"
        echo $ret
        return
    fi
    if [ -f "/usr/local/bin/zsh" ]; then
        ret="/usr/local/bin/zsh"
        echo $ret
        return
    fi
    echo $ret
}

export ZSH_PATH=`get_zsh_path`
export FZF_PATH=`which fzf`

function setup_kubectl_config() {
    KUBECONFIG=""
    cfgdir=$1
    if [ -z $cfgdir ]; then
        cfgdir="$HOME/.kube/configs"
    fi
    if [ ! -e $cfgdir ]; then
        return
    fi
    for f in $cfgdir/*.yaml; do
        KUBECONFIG=$f:$KUBECONFIG
    done
    export KUBECONFIG
}
setup_kubectl_config

[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"