Philip's Configuration for POSIX Environment
============================================

# Prerequisite

Prepare for git

    $git config user.name "Philip Ye"
    $git config user.email "phye@cisco.com"

Before push, need to add remote host by the following cmd:

    $git remote add short_name git@$remote_host:$remote_path

# Oh My Zshell
Refer to the project link [https://github.com/robbyrussell/oh-my-zsh]. Commands to install is:
  
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

If you want to change default shell to zsh,
  
    chsh -s /bin/zsh

To use phye's own theme, add phye's repo first

    cd ~/.oh-my-zsh
    git remote add phye git@github.com:phye/oh-my-zsh.git
    git fetch phye

Then update .zshrc to use `phye` theme
    
# TPM
To use TPM (TMUX Plugin Manager), refer to project link [https://github.com/tmux-plugins/tpm]. Command 
to install is:

    $ git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

And update .tmux.conf as below:

    # List of plugins
    set -g @plugin 'tmux-plugins/tpm'
    set -g @plugin 'tmux-plugins/tmux-sensible'

    # Other examples:
    # set -g @plugin 'github_username/plugin_name'
    # set -g @plugin 'git@github.com/user/plugin'
    # set -g @plugin 'git@bitbucket.com/user/plugin'

    # Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
    run '~/.tmux/plugins/tpm/tpm'

Source tmux config and use `C-a + I` to install plugins.

# Recommendations
Command line utils recommended to install are:
  
    - tmux
    - ctags
    - zsh
    - oh-my-zsh
    - fzf
