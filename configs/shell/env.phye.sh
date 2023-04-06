# ENVs {{{
export SCRIPTS=${HOME}/bin/scripts
export EDITOR='vim'
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export GOPATH=~/ws/go
export PATH="$HOME/bin/scripts:/opt/homebrew/bin:$HOME/bin:$GOPATH/bin:$HOME/.cargo/bin:/snap/bin:/usr/local/bin:/usr/local/opt/fzf/bin:/usr/local/opt/llvm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/TeX/texbin:/opt/X11/bin:/Library/Apple/usr/bin:$HOME/.fzf/bin"
export LD_LIBRARY_PATH="/usr/local/lib:/opt/rh/devtoolset-9/root/usr/lib64/"
export MANPATH=":/usr/local/share/man"
export PIPDIR=`pip3 show powerline-status | perl -nwl -e 'if (m/Location: (.*)/) {print $1}'`
export LESS="-R"
#export JAVA_HOME=`/usr/libexec/java_home`
export INFOPATH="/opt/homebrew/share/info"
#export GUILE_LOAD_PATH="/usr/local/share/guile/site/3.0"
#export GUILE_LOAD_COMPILED_PATH="/usr/local/lib/guile/3.0/site-ccache"
#export GUILE_SYSTEM_EXTENSIONS_PATH="/usr/local/lib/guile/3.0/extensions"

# hidpi support
# qt 5
export QT_AUTO_SCREEN_SCALE_FACTOR=1
# gtk 3
# export GDK_SCALE=2
# export GDK_DPI_SCALE=0.5
# }}}

# disable path unify
# PATH="$(perl -e 'print join(":", grep { not $seen{$_}++ } split(/:/, $ENV{PATH}))')"
export HOMEBREW_GITHUB_API_TOKEN=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
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
