# zsh widgets
fpath=(${MY_ZSH_DIR}/widgets $fpath)

autoload edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

autoload -U select-word-style
select-word-style bash

autoload -U glob-alias
zle -N glob-alias
bindkey -M emacs "^ " glob-alias
bindkey -M viins "^ " glob-alias

autoload -U insert-last-command-output
zle -N insert-last-command-output
bindkey "^X^L" insert-last-command-output
