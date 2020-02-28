#!/bin/bash
# Exit on any error!
set -e

# TODO(phye): replace ROOT_DIR dynamically
GITDIR=$(pwd)
mkdir -p ${HOME}
mkdir -p ${HOME}/bin

echo "1. Configure all submodules"
# vim
[ -s ~/.vim ] && rm ~/.vim
ln -sf ${GITDIR}/modules/vim.d/vim/ ~/.vim
ln -sf ${GITDIR}/modules/vim.d/vimrc ~/.vimrc

# emacs
[ -d ~/.emacs.d ] && mv ~/.emacs.d ~/.emacs.d.old
[ -s ~/.emacs.d ] && rm ~/.emacs.d
ln -s ${GITDIR}/modules/emacs.d/ ~/.emacs.d

# oh-my-zsh
[ -d ~/.oh-my-zsh ] && mv ~/.oh-my-zsh ~/.on-my-zsh.old
[ -s ~/.oh-my-zsh ] && rm ~/.oh-my-zsh
ln -s ${GITDIR}/modules/oh-my-zsh/ ~/.oh-my-zsh

# tpm
mkdir -p ${HOME}/.tmux
ln -sf ${GITDIR}/modules/tpm/ ~/.tmux/plugins/tpm

echo "2. Link all common configs"
# git
[ -f ~/.gitconfig ] && mv ~/.gitconfig ~/.gitconfig.old
ln -s ${GITDIR}/configs/git/gitconfig ~/.gitconfig

# shell
ln -sf ${GITDIR}/configs/shell/shrc.phye.sh ~/.shrc.phye.sh
ln -sf ${GITDIR}/configs/shell/git-completion.bash ~/.git-completion.bash
ln -sf ${GITDIR}/configs/shell/bashrc.phye.sh ~/.bashrc.phye.sh
ln -sf ${GITDIR}/configs/shell/zshrc.phye.sh ~/.zshrc.phye.sh
ln -sf ${GITDIR}/configs/shell/zshrc.sh ~/.zshrc

# tmux
[ -f ~/.tmux.conf ] && mv ~/.tmux.conf ~/.tmux.conf.old
ln -s ${GITDIR}/configs/tmux/tmux.conf ~/.tmux.conf

echo "3. Patching existing configs"
# bash
grep "bashrc.phye.sh" ${HOME}/.bashrc || echo '[ -f ~/.bashrc.phye ] && . ~/.bashrc.phye ' >> ${HOME}/.bashrc

echo "4. Linking all scripts"
ln -s ${GITDIR}/scripts/ ${HOME}/bin/scripts

echo "5. Config all sytles"

echo "!!! Enjoy !!!"
