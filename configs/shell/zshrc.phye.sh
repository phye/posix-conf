HISTFILE=~/.histfile
HISTSIZE=500000
SAVEHIST=500000

autoload edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

hash -d conf=~/ws/posix-conf
hash -d gtd=~/ws/gtd
hash -d gows=~/ws/go/src/github.com/phye
hash -d ebooks=~/Documents/OneDrive/Ebooks
hash -d media=~/ws/yt-media-ai-videounderstanding
hash -d public=~/ws/yt-public-cloud
hash -d biz=~/ws/yt-industry-ai
hash -d proto=~/ws/yt-industry-ai/proto
hash -d common=~/ws/yt-industry-ai/yt-server-common
hash -d gocommon=~/ws/yt-industry-ai/yt-go-common
hash -d gitwoa=~/ws/git.code
hash -d github=~/ws/github
hash -d emacs=~/.emacs.d
hash -d emacsdata=~/.emacs.data.d
hash -d ssd=/Volumes/phye-ssd
hash -d onedrive=~/Documents/OneDrive
hash -d legacy=~/ws/legacy
hash -d trpc=~/ws/git.code/trpc
hash -d ticloud=~/ws/ti-cloud
hash -d tiinfra=~/ws/ti-cloud/infra
hash -d k8stotal=~/ws/github/k8s.total

#fpath=(~/ws/posix-conf/configs/shell/ $fpath)

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
fi

load_if_exist ${HOME}/.shrc.phye.sh