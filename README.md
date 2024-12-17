# My configs

This directory contains the configs for my system

## Requirements

Ensure you have the following installed on your system

```
Git
Stow
Zsh
batcat 
bat-extras from git@github.com:eth-p/bat-extras.git
Syncthing
FZF from git@github.com:junegunn/fzf.git. run install script
tpm from git@github.com:tmux-plugins/tpm.git
ripgrep
neofetch
nvim
tmux
zoxide
```
Base:
'''
git
stow
'''

gui and DE dependencies
'''
wezterm
alactritty
keepassxc
i3
rofi
'''

zsh cmd line dependencies
'''
zsh
batcat 
bat-extras from git@github.com:eth-p/bat-extras.git
fzf from git@github.com:junegunn/fzf.git. run install script
tpm from git@github.com:tmux-plugins/tpm.git
ripgrep
neofetch
tmux
zoxide
'''

other
'''
syncthing
syncthingtray
nvim
'''

#### optional: 
programs which there are no configuration for but which are used in this installation
nitrogen is a basic wallpaper application
'''nitrogen'''

picom is a deskop compositor. It allows windows to have opacity characterisitcs. 
It can also add rounded window borders.
i3 config automatically intiialises it
'''picom'''

qt5ct allows the setting of qt themes. some application use QT over gtk
'''qt5ct'''

These are also listed in ./dependencies

## Installation

First, check out the stow repo in your $HOME directory using git
instructions for installation are listed below and in ./install-script.sh

```
$ cd ~
$ git clone https://github.com/JDaggers/Stow.git
```

make directories that shouldn`t be symlinked
```
$ mkdir -p .config .local/share .local/state
$ mkdir -p .local/share/tmux/plugins
$ mkdir -p .config/gtk-3.0 .config/autostart
$ mkdir -p .config/syncthing
```

install bat-extras
```
$ git clone git@github.com:eth-p/bat-extras.git
$ bash ./bat-extras/build.sh --install
$ rm -rf bat-extras
```

bat needs its cache built for themeing
```
$ bat cache --build
```

fzf needs to be installed from source. say no to all the automated completion options
```
$ git clone git@github.com:junegunn/fzf.git
$ mv fzf .fzf
$ bash ./.fzf/install
```

tpm source needs to be installed
```
$ cd .local/share/tmux/plugins
$ git clone git@github.com:tmux-plugins/tpm.git
$ cd ~
```
when tmux is first loaded: <leader>I to install plugins

syncthing config is in ignore file because synthing doesnt play nice with symlinks
generate a config and manually replace the generated one
```
$ syncthing --generate ~/.config/syncthing --no-default-folder
$ rm .config/syncthing.config.xml
$ cp stow/.config/syncthing.config.xml .config/syncthing
```

then use stow to create symlinks
```
$ cd stow
$ stow .
```

create branches for hardware or system configuration differences
