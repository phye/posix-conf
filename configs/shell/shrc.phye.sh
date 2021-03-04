# ENVs {{{
export SCRIPTS=${HOME}/bin/scripts
export PATH="$HOME/bin/scripts:$HOME/bin:$PATH"
export EDITOR='vim'
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export GOPATH=~/ws/go
export PATH=$PATH:$GOPATH/bin
export PIPDIR=$(pip3 show powerline-status | perl -nwl -e 'if (m/Location: (.*)/) {print $1}')
# }}}
export LD_LIBRARY_PATH=/usr/local/lib
export MANPATH=/usr/local/share/man

PATH="$(perl -e 'print join(":", grep { not $seen{$_}++ } split(/:/, $ENV{PATH}))')"

[ -f ${HOME}/.proxy.sh ] && source ${HOME}/.proxy.sh
[ -f ${SCRIPTS}/functions.sh ] && source ${SCRIPTS}/functions.sh
[ -f ${SCRIPTS}/aliases.sh  ] && source ${SCRIPTS}/aliases.sh
