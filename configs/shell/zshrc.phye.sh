HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=5000

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
hash -d ssd=/Volumes/phye-ssd
hash -d onedrive=~/Documents/OneDrive
hash -d legacy=~/ws/legacy
hash -d trpc=~/ws/git.code/trpc
hash -d ticloud=~/ws/ti-cloud
hash -d tiinfra=~/ws/ti-cloud/infra

fpath=(~/ws/posix-conf/configs/shell/ $fpath)

function load_if_exist () {
    [ -f $1 ] && source $1
}

function load_omz_plugin() {
    f=~/.oh-my-zsh/plugins/$1/$1.plugin.zsh
    load_if_exist $f
}

load_if_exist /usr/share/fzf/key-bindings.zsh
load_if_exist /usr/share/fzf/completion.zsh
load_if_exist ${HOME}/.fzf.zsh
load_if_exist ~/.shrc.phye.sh

if [ ! -z "$IS_GRML" ]; then
    load_omz_plugin git
    load_omz_plugin tmux
    load_omz_plugin kubectl
fi
