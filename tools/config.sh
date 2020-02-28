#!/bin/bash
# TODO(phye): replace ROOT_DIR dynamically
GITDIR=$(pwd)
mkdir -p ${HOME}
mkdir -p ${HOME}/bin

echo "1. Configure all submodules"
# vim
ln -s ${GITDIR}/modules/vim.d/vim ~/.vim
ln -s ${GITDIR}/modules/vim.d/vimrc ~/.vimrc

# emacs
ln -s ${GITDIR}/modules/emacs.d ~/.emacs.d

# oh-my-zsh
ln -s ${GITDIR}/modules/oh-my-zsh ~/.oh-my-zsh

# tpm
ln -s ${GITDIR}/modules/tpm ~/.tpm

echo "2. Link all common configs"
# git
ln -s ${GITDIR}/configs/git/gitconfig ~/.gitconfig

# shell
ln -s ${GITDIR}/configs/shell/shrc.phye.sh ~/.shrc.phye.sh
ln -s ${GITDIR}/configs/shell/git-completion.bash /.git-completion.bash
ln -s ${GITDIR}/configs/shell/bashrc.phye.sh ~/.bashrc.phye.sh
ln -s ${GITDIR}/configs/shell/zshrc.phye.sh ~/.zshrc.phye.sh
ln -sf ${GITDIR}/configs/shell/zshrc.sh ~/.zshrc.sh

# tmux
ln -s ${GITDIR}/configs/tmux/tmux.conf ~/.tmux.conf

echo "3. Patching existing configs"
# bash
grep "bashrc.phye.sh" ${HOME}/.bashrc >> /dev/null
if [ $? != 0 ]; then
    echo '[ -f ~/.bashrc.phye ] && . ~/.bashrc.phye ' >> ${HOME}/.bashrc
fi

echo "4. Linking all scripts"
ln -s ${GITDIR}/scripts ${HOME}/bin/scripts

echo "5. Config all sytles"

echo "!!! Enjoy !!!"