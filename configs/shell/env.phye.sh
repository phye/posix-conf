# ENVs {{{
export SCRIPTS=${HOME}/bin/scripts
export PATH="$HOME/bin/scripts:$HOME/bin:/snap/bin:$PATH"
export EDITOR='vim'
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export GOPATH=~/ws/go
export PATH=$PATH:$GOPATH/bin
export PIPDIR="$(pip3 show powerline-status | perl -nwl -e 'if (m/Location: (.*)/) {print $1}')"
export LD_LIBRARY_PATH="/usr/local/lib:"
export MANPATH=":/usr/local/share/man"

# hidpi support
# qt 5
export QT_AUTO_SCREEN_SCALE_FACTOR=1
# gtk 3
export GDK_SCALE=2
export GDK_DPI_SCALE=0.5
# }}}

PATH="$(perl -e 'print join(":", grep { not $seen{$_}++ } split(/:/, $ENV{PATH}))')"
