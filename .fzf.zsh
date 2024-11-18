# Setup fzf
# ---------
if [[ ! "$PATH" == *${HOME}/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}${HOME}/.fzf/bin"
fi

if [ -f ~/.fzfrc ]; then
    export FZF_DEFAULT_OPTS_FILE=$HOME/.fzfrc
fi
export FZF_DEFAULT_COMMAND='rg --hidden --files --follow -d 5'
export FZF_COMPLETION_TRIGGER=''

source <(fzf --zsh)

