# My configs

This directory contains the configs for my macbook 2015 running ubuntu.

## Requirements

Ensure you have the following installed on your system.

Base:
```
git
stow
```

GUI and DE dependencies:
```
wezterm
alactritty
keepassxc
i3
rofi
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
syncthingtray
nvim
```

#### Optional: 
Programs which there are no configuration for but which are used in this installation.

Nitrogen is a basic wallpaper application
```
nitrogen
```

Picom is a deskop compositor. It allows windows to have opacity characterisitcs. 
It can also add rounded window borders.
i3 config automatically intiialises it.
```
picom
```

qt5ct allows the setting of qt themes. Some application use QT over gtk.
```
qt5ct
```

These are also listed in ./dependencies.

## Installation
Instructions for the installation are listed below and in ./install-script.sh

First, check out the stow repo in your $HOME directory using git.
```
$ cd ~
$ git clone https://github.com/JDaggers/Stow.git
```

Make directories that shouldn`t be symlinked.
```
$ mkdir -p .config .local/share .local/state
$ mkdir -p .local/share/tmux/plugins
$ mkdir -p .config/gtk-3.0 .config/autostart
$ mkdir -p .config/syncthing
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

Syncthing's config is in the ./.stow-ignore-local ignore file because syncthing doesn't play nice with symlinks.
Generate a config and manually replace the generated one.
```
$ syncthing --generate ~/.config/syncthing --no-default-folder
$ rm .config/syncthing.config.xml
$ cp stow/.config/syncthing.config.xml .config/syncthing
```

Then use stow to create symlinks.
```
$ cd stow
$ stow .
```

Create branches for hardware or system configuration differences.
