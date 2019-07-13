ZSH_THEME="cobalt2-pydemia"

# enable color support of ls and also add handy aliases
if [ -x $(which dircolors) ]; then
    test -r /etc/zsh/pydemia-theme/.pydemia-config/.dircolors && eval "$(dircolors -b /etc/zsh/pydemia-theme/.pydemia-config/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

source /etc/zsh/pydemia-theme/.pydemia-config/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

alias sudo='sudo '
