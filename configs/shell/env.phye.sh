# ENVs {{{
export SCRIPTS=${HOME}/bin/scripts
export EDITOR='vim'
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export GOPATH=~/ws/go
export PATH="$HOME/bin/scripts:/opt/homebrew/bin:$HOME/bin:$GOPATH/bin:$HOME/.cargo/bin:/snap/bin:/usr/local/go/bin:/usr/local/bin:/usr/local/opt/fzf/bin:/usr/local/opt/llvm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/TeX/texbin:/opt/X11/bin:/Library/Apple/usr/bin:$HOME/.fzf/bin:/opt/homebrew/opt/gnupg@2.2/bin"
export LD_LIBRARY_PATH="/usr/local/lib"
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

function get_pip_path() {
    if [[ $OSTYPE == 'darwin'* ]]; then
        echo "/opt/homebrew/lib/python3.11/site-packages"
        return
    fi
    echo "/usr/lib/python3.11/site-packages"
}
export PIPDIR=`get_pip_path`
export ZSH_PATH=`get_zsh_path`
export FZF_PATH=`which fzf`

function setup_kubectl_config() {
    KUBECONFIG=""
    cfgdir=$1
    if [ -z $cfgdir ]; then
        cfgdir="$HOME/.kube/configs"
    fi
    for f in $cfgdir/*.yaml; do
        KUBECONFIG=$f:$KUBECONFIG
    done
    export KUBECONFIG
}
setup_kubectl_config