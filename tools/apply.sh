#!/bin/bash
# Exit on any error!
set -e
alias lnd='ln -sT -b'

# TODO(phye): replace ROOT_DIR dynamically
GITDIR=$(pwd)
mkdir -p ${HOME}
mkdir -p ${HOME}/bin
mkdir -p ${HOME}/.tmux/plugins/

echo "1. Configure all submodules"
# vim
lnd -f ${GITDIR}/modules/vim.d/vim/ ~/.vim
ln -sfb ${GITDIR}/modules/vim.d/vimrc ~/.vimrc

# emacs
lnd -f ${GITDIR}/modules/emacs.d/ ~/.emacs.d

# oh-my-zsh
lnd -f ${GITDIR}/modules/oh-my-zsh/ ~/.oh-my-zsh

# tpm
lnd -f ${GITDIR}/modules/tpm/ ~/.tmux/plugins/tpm

echo "2. Link all common configs"
# git
ln -sfb ${GITDIR}/configs/git/gitconfig ~/.gitconfig

# shell
ln -sfb ${GITDIR}/configs/shell/shrc.phye.sh ~/.shrc.phye.sh
ln -sfb ${GITDIR}/configs/shell/git-completion.bash ~/.git-completion.bash
ln -sfb ${GITDIR}/configs/shell/bashrc.phye.sh ~/.bashrc.phye.sh
ln -sfb ${GITDIR}/configs/shell/zshrc.phye.sh ~/.zshrc.phye.sh
ln -sfb ${GITDIR}/configs/shell/zshrc.sh ~/.zshrc

# tmux
ln -sfb ${GITDIR}/configs/tmux/tmux.conf ~/.tmux.conf

echo "3. Patching existing configs"
# bash
if grep -q "bashrc.phye.sh" ${HOME}/.bashrc; then
    echo "Already patched bashrc, continue"
else
    echo -e "\n[ -f .bashrc.phye.sh ] && source .bashrc.phye.sh" >> ${HOME}/.bashrc
fi
#if [[ $(ls -al) -ne 0 ]]; then
#    echo "hi"
#fi

echo "4. Linking all scripts"
lnd -f ${GITDIR}/scripts/ ${HOME}/bin/scripts

echo "5. Config all sytles"

echo "!!! Enjoy !!!"
