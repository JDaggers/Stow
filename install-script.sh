#!/bin/bash
# script or just instructions for installing config
cd ~
# make directories that shouldn't be symlinked
mkdir -p .config .local/share .local/state
mkdir -p .local/share/tmux/plugins
# install bat-extras
git clone git@github.com:eth-p/bat-extras.git
bash ./bat-extras/build.sh --install
rm -rf bat-extras
# bat needs its cache built for themeing
bat cache --build
# fzf needs to be installed from source. say no to all the automated completion options
git clone git@github.com:junegunn/fzf.git
mv fzf .fzf
bash ./.fzf/install
# tpm source needs to be installed
cd .local/share/tmux/plugins
git clone git@github.com:tmux-plugins/tpm.git
# when tmux is first loaded: <leader>I to install plugins
cd ~
stow .
