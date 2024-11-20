alias ls='ls -lahH --color=auto'
alias vim='nvim'
NVIM=/home/james/.config/nvim
alias py='python3'
alias sudo='sudo '
alias c='clear'

# default
if [ -x /usr/bin/dircolors ]; then
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias diff='diff --color=auto'
    alias ip='ip --color=auto'
fi
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
