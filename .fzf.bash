# Setup fzf
# ---------
if [[ ! "$PATH" == */home/james/.fzf/bin* ]]; then
    PATH="${PATH:+${PATH}:}/home/james/.fzf/bin"
fi

if [ -f ~/.fzfrc ]; then
    export FZF_DEFAULT_OPTS_FILE=$HOME/.fzfrc
fi
export FZF_DEFAULT_COMMAND='rg --hidden --files --follow -d 5'
export FZF_COMPLETION_TRIGGER=''

eval "$(fzf --bash)"

if [ -f ~/.fzf/shell/completion.bash && -f ~/.fzf/shell/key-bindings.bash ]; then
    source ~/.fzf/shell/completion.bash
    source ~/.fzf/shell/key-bindings.bash
fi
