# My configs

This directory contains the configs for my mac mini 2012 server.

## Requirements

Ensure you have the following installed on your system.

Base:
```
git
stow
```

zsh cmd line dependencies:
```
zsh
batcat 
bat-extras from git@github.com:eth-p/bat-extras.git
fzf from git@github.com:junegunn/fzf.git. run install script
tpm from git@github.com:tmux-plugins/tpm.git
ripgrep
neofetch
tmux
zoxide
```

Others:
```
syncthing
nvim
```

These are also listed in ./dependencies.

## Installation
Instructions for the installation are listed below and in ./install-script.sh

First, check out the stow repo in your $HOME directory using git.
```
$ cd ~
$ git clone https://github.com/JDaggers/Stow.git
$ mv Stow stow
$ cd stow
$ git switch james-server
$ cd ~
```

Make directories that shouldn`t be symlinked.
```
$ mkdir -p .config .local/share .local/state
$ mkdir -p .local/share/tmux/plugins
```

Install bat-extras.
```
$ git clone git@github.com:eth-p/bat-extras.git
$ bash ./bat-extras/build.sh --install
$ rm -rf bat-extras
```

Bat needs its cache built for themeing.
```
$ bat cache --build
```

fzf needs to be installed from source. Say no to all the automated completion options.
```
$ git clone git@github.com:junegunn/fzf.git
$ mv fzf .fzf
$ bash ./.fzf/install
```

tpm source needs to be installed.
```
$ cd .local/share/tmux/plugins
$ git clone git@github.com:tmux-plugins/tpm.git
$ cd ~
```
When tmux is first loaded: [prefix]I to install plugins.

Then use stow to create symlinks.
```
$ cd stow
$ stow .
```

The process for creating and configuring the syncthing user, adding the syncthing system service are not yet document or included in the repo.

Create branches for hardware or system configuration differences.
