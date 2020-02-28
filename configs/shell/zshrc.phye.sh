# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=5000
setopt inc_append_history appendhistory autocd extendedglob nomatch
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall

#autoload -Uz compinit
#compinit
# End of lines added by compinstall

autoload edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

hash -d notes=~/ws/OrgNotes
hash -d gows=/ws/go/src/github.com/phye

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.shrc.phye.sh ] && source ~/.shrc.phye.sh
