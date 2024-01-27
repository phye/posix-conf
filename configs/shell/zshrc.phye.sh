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
[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh
[ -f ${HOME}/.fzf.zsh ] && source ${HOME}/.fzf.zsh
[ -f ~/.shrc.phye.sh ] && source ~/.shrc.phye.sh
[ -f ~/.oh-my-zsh/plugins/git/git.plugin.zsh  ] && source ~/.oh-my-zsh/plugins/git/git.plugin.zsh
[ -f ~/.oh-my-zsh/plugins/tmux/tmux.plugin.zsh ] && source ~/.oh-my-zsh/plugins/tmux/tmux.plugin.zsh