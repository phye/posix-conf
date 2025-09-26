# zsh dir alias
hash -d conf=~/ws/posix-conf
hash -d gtd=~/ws/gtd
hash -d ebooks=~/Documents/OneDrive/Ebooks
hash -d gitwoa=~/ws/git.code
hash -d github=~/ws/github
hash -d emacs=~/.emacs.d
hash -d emacsdata=~/.emacs.data.d
hash -d ssd=/Volumes/phye-ssd
hash -d onedrive=~/Documents/OneDrive
#hash -d legacy=~/ws/legacy
hash -d trpc=~/ws/trpc
hash -d ti=~/ws/ti-cloud
hash -d infra=~/ws/ti-cloud/infra
hash -d k8stotal=~/ws/github/k8s.total
hash -d adp=~/ws/adp
hash -d legacy=~/ws/adp/legacy

function load_if_exist () {
    [ -f $1 ] && source $1
}

if [ ! -z "$IS_GRML" ]; then
    function load_omz_plugin() {
        f=${HOME}/.oh-my-zsh/plugins/$1/$1.plugin.zsh
        load_if_exist $f
    }

    load_omz_plugin fzf
    load_omz_plugin gitfast
    load_omz_plugin git
    load_omz_plugin kubectl
    load_omz_plugin tmux
    load_omz_plugin zoxide
fi

load_if_exist ${HOME}/.shrc.phye.sh
load_if_exist ${MY_ZSH_DIR}/load.widgets.zsh
load_if_exist ${MY_ZSH_DIR}/setopts.zsh
load_if_exist ${MY_ZSH_DIR}/alias.zsh
