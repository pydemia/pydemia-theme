ZSH_THEME="cobalt2-pydemia"

# enable color support of ls and also add handy aliases
if [ -x "$(which dircolors)" ]; then
    test -r ~/.pydemia-config/.dircolors && eval "$(dircolors -b ~/.pydemia-config/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

source ~/.pydemia-config/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

alias sudo='sudo '

# f not running interactively, don't do anything
# [ -z "$PS1" ] && return

# export PS1="\[\e[31m\]tf-docker\[\e[m\] \[\e[33m\]\w\[\e[m\] > "
# export TERM=xterm-256color
alias grep="grep --color=auto"
alias ls="ls --color=auto"

echo -e "\e[1;31m"

# MOTD message
printf '%s' "$GREEN"
printf '%s\n' '_________             __                             '
printf '%s\n' '___/ __  /___________/ /________________________     '
printf '%s\n' '__/ /_/ // / / // __  // _ \ / __ `__ \_/_// __ `    '
printf '%s\n' '_/  ___// /_/ // / /_//  __// / / / / // // /_/ |    '
printf '%s\n' '/__/    \__, / \____/ \___//_/ /_/ /_//_/ \___,_\    '
printf '%s\n' '       /____/                                        '
printf "%s\n"
printf "${BLUE}${BOLD}%s${NORMAL}\n" "$(lsb_release -icrd)"

echo -e "\e[0;33m"

cat <<WARN
NOTICE:
To use 'gcloud'   : gcloud init
To use 'aws cli'  : aws configure
To use 'azure cli': azure login
WARN

# Turn off colors
echo -e "\e[m"
