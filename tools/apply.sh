#!/bin/bash
# Exit on any error!
set -e

# TODO(phye): replace ROOT_DIR dynamically
GITDIR=$(pwd)
mkdir -p ${HOME}
mkdir -p ${HOME}/bin
mkdir -p ${HOME}/.tmux/plugins/

source ${GITDIR}/scripts/aliases.sh

echo "1. Configure all submodules"
# vim
lnd -f ${GITDIR}/modules/vim.d/vim/ ~/.vim
lnf -f ${GITDIR}/modules/vim.d/vimrc ~/.vimrc

# emacs
lnd -f ${GITDIR}/modules/emacs.d/ ~/.emacs.d

# oh-my-zsh
lnd -f ${GITDIR}/modules/oh-my-zsh/ ~/.oh-my-zsh

# tpm
lnd -f ${GITDIR}/modules/tpm/ ~/.tmux/plugins/tpm

# fzf
lnd -f ${GITDIR}/modules/fzf ~/.fzf

echo "2. Link all common configs"
# git
lnf -f ${GITDIR}/configs/git/gitignore ~/.gitignore
lnf -f ${GITDIR}/configs/git/gitconfig ~/.gitconfig

# shell
lnf -f ${GITDIR}/configs/shell/env.phye.sh ~/.env.phye.sh
lnf -f ${GITDIR}/configs/shell/shrc.phye.sh ~/.shrc.phye.sh
lnf -f ${GITDIR}/configs/shell/git-completion.bash ~/.git-completion.bash
lnf -f ${GITDIR}/configs/shell/git-completion.zsh ~/.git-completion.zsh
lnf -f ${GITDIR}/configs/shell/bashrc.phye.sh ~/.bashrc.phye.sh
lnf -f ${GITDIR}/configs/shell/zshrc.phye.sh ~/.zshrc.phye.sh
lnf -f ${GITDIR}/configs/shell/zshrc.grml.sh ~/.zshrc.grml.sh
lnf -f ${GITDIR}/configs/shell/zshrc.omz.sh ~/.zshrc.omz.sh
lnf -f ${GITDIR}/configs/shell/proxy.sh ~/.proxy.sh
if [ "$1" == "omz" ]; then
    lnf -f ${GITDIR}/configs/shell/zshrc.omz.sh ~/.zshrc
elif [ "$1" == "grml" ]; then
    lnf -f ${GITDIR}/configs/shell/zshrc.grml.sh ~/.zshrc
else
    echo "remember to set zshrc by yourself"
fi


# tmux
lnf -f ${GITDIR}/configs/tmux/tmux.conf ~/.tmux.conf

echo "3. Patching existing configs"
# bash
if grep -q "bashrc.phye.sh" ${HOME}/.bashrc; then
    echo "Already patched bashrc, continue"
else
    echo "[ -f ${HOME}/.bashrc.phye.sh ] && source ${HOME}/.bashrc.phye.sh" >> ${HOME}/.bashrc
fi

if grep -q "env.phye.sh" ${HOME}/.bash_profile; then
    echo "Already patched bash_profile, continue"
else
    echo "[ -f ${HOME}/.env.phye.sh ] && source ${HOME}/.env.phye.sh" >> ${HOME}/.bash_profile
fi

if grep -q "env.phye.sh" ${HOME}/.zshenv; then
    echo "Already patched zshenv, continue"
else
    echo "[ -f ${HOME}/.env.phye.sh ] && source ${HOME}/.env.phye.sh" >> ${HOME}/.zshenv
fi


#if [[ $(ls -al) -ne 0 ]]; then
#    echo "hi"
#fi

echo "4. Linking all scripts"
lnd -f ${GITDIR}/scripts/ ${HOME}/bin/scripts

echo "5. Config all sytles"

echo "!!! Enjoy !!!"
