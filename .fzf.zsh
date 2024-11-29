# Setup fzf
# ---------
if [[ ! "$PATH" == *${HOME}/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}${HOME}/.fzf/bin"
fi

if [ -f ~/.fzfrc ]; then
    export FZF_DEFAULT_OPTS_FILE=$HOME/.fzfrc
fi
export FZF_DEFAULT_COMMAND='rg --hidden --files --follow -d 5'
export FZF_ALT_C_COMMAND='find -L . -maxdepth 5 -type d'
export FZF_ALT_C_OPTS="--preview='tree -C {}'"
export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
# export FZF_COMPLETION_TRIGGER=''

source <(fzf --zsh)

