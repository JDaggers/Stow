# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# setup fzf
if [[ ! "$PATH" == *${HOME}/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}${HOME}/.fzf/bin"
fi

if [ -f ~/.fzfrc ]; then
    export FZF_DEFAULT_OPTS_FILE=$HOME/.fzfrc
fi
export FZF_DEFAULT_COMMAND='rg --hidden --files --follow -d 5'
export FZF_COMPLETION_TRIGGER=''

source <(fzf --zsh)

# setup zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [ ! -d $ZINIT_HOME ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "${ZINIT_HOME}/zinit.zsh"

# PLUGINS
zinit ice depth=1

# prompt
zinit light romkatv/powerlevel10k
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# syntax highlighting
zinit light zsh-users/zsh-syntax-highlighting

# auto completions
zinit light zsh-users/zsh-completions

# fzf-tab
zinit light Aloxaf/fzf-tab

# zinit snippets
zinit snippet OMZP::git
zinit snippet OMZP::tmux
zinit snippet OMZP::sudo
zinit snippet OMZP::command-not-found

# PLUGINS END

# load cached completions
autoload -U compinit && compinit
zinit cdreplay -q

# keybindings
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# History configurations
HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=5000
HISTDUP=erase
setopt append_history
setopt sharehistory
setopt hist_ignore_dups
setopt hist_ignore_all_dups   
setopt hist_save_no_dups
setopt hist_ignore_space
# setopt hist_verify # load selected history into buffer first
setopt hist_find_no_dups

# completion remove case-sensitivity
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
# completion add colors
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
# completion disable default menu
zstyle ':completion:*' menu no
# add fzf-tab completion menu
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls $realpath'

# aliases
if [ -f ~/.zsh_aliases ]; then
    . ~/.zsh_aliases
fi

. "$HOME/.cargo/env"

# setup zoxide
export _ZO_DATA_DIR=$HOME/.local/share/zoxide
export _ZO_FZF_OPTS='--preview=""'
export _ZO_MAXAGE=10000
export _ZO_ECHO=0
export _ZO_RESOLVE_SYMLINKS=1
export _ZO_EXCLUDE_DIRS='$HOME/.cargo;$HOME/.vim'
source <(zoxide init zsh --cmd cd --hook pwd)


# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
