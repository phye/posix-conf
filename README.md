phye's Configuration for POSIX Environment
==========================================

# Intro
Most of my daily works are finished on an mbp 2017 running macOS
10.15, with macOS as the platform for docs (and wechatting :-) and a
remote CentOS Linux VM (which will be ssh-ed to from the macOS) as the 
platform for coding. I also have an ArchLinux (which is my favorate
Linux distro) with i3 as DM at home where I may do some other tasks
that's not suitable at the macOS mentioned above.

Very often, when I configured some *fancy* thing at one machine (which
of course should be cross platformed, such as some conf for tmux or
shell), I failed to find the same config in another due to the
following reasons:

  - Difficulties to sync configs among three kinds of OS
  - Compliance issues between tools in different OS, such as '-c' flag
    of ls
  - Subtle but annoying difference related to path, such as the place of
    pip dir 

I've been thinking for quite a long time to find a solution for this
problem and this repo is my first attempt. By maintaining one repo and
one branch for all POSIX compliant systems (mainly for Linux and
macOS, though), I can minimize the efforts to sync my configs.

# Usage
Simply clone this repo and run the `apply.sh` within tools folder and
we're done
```sh
git clone --recurse-submodules https://github.com/phye/posix-conf.git /path/to/posix-conf
cd /path/to/posix-conf
sh ./tools/apply.sh
```

# CLI tools list
My personal CLI selections are:
  
  - tmux 
  - tpm (tmux plugin manager)
  - emacs (with evil mode to mimic vim)
  - vim
  - zsh(oh-my-zsh)
  - fzf
  - zoxide
  - shfmt

# Hints
## Emacs like key bindings for google-chrome in plasma 5
Set `gtk-key-theme-name` to `Emacs` in ~/.config/gtk-3.0/settings.ini, and restart chrome. 

    [Settings]
    gtk-key-theme-name = Emacs

# Prerequisite

## [nerd font](https://github.com/ryanoasis/nerd-fonts?tab=readme-ov-file#option-2-homebrew-fonts) (for tmux-power)
```
brew tap homebrew/cask-fonts
brew install font-hack-nerd-font
```
Then, in iterm tab, choose 'Hack Nerd Font Propo'
