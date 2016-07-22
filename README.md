Philip's Configuration for POSIX Environment
============================================

Prerequisite
------------

Prepare for git

    $git config user.name "Philip Ye"
    $git config user.email "phye@cisco.com"

Before push, need to add remote host by the following cmd:

    $git remote add short_name git@$remote_host:$remote_path

TPM
---
TPM, tmux package manager provides several fantastic plugins for tmux. 
To use it, do the following:

    $ git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

To install plugins:

    $ git clone https://github.com/tmux-plugins/tmux-copycat ~/.tmux/plugins/tmux-copycat
    $ git clone https://github.com/tmux-plugins/tmux-continuum ~/.tmux/plugins/tmux-continuum
    $ git clone https://github.com/tmux-plugins/tmux-sensible ~/.tmux/plugins/tmux-sensible
    $ git clone https://github.com/tmux-plugins/tmux-yank ~/.tmux/plugins/tmux-yank

Misc
----
To enable command-t plugin for vim, do the following things:

    wget ftp://10.74.61.154/pub2/phye/tars/vim-7.4.tar.bz2
    tar xjf vim-7.4.tar.bz2
    yum install ruby ruby-devel 
    ./configure --with-features=huge \
      --enable-rubyinterp \
      --enable-pythoninterp \
      --enable-perlinterp \
      --enable-cscope --prefix=$HOME
    make && make install
 
On hitting tgetent() error during configure, run 'yum install ncurses-devel'


Oh My Zshell
------------
Refer to the project link [https://github.com/robbyrussell/oh-my-zsh]. Commands to install is:
  
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

If you want to change default shell to zsh,
  
    chsh -s /bin/zsh
