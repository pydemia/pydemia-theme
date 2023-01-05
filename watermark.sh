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
# Get OS
get_os() {
  case $(uname | tr '[:upper:]' '[:lower:]') in
    linux*)
      export OS_NAME=linux
      ;;
    darwin*)
      export OS_NAME=osx
      ;;
    # msys*)
    #   export OS_NAME=windows
    #   ;;
    # *)
    #   export OS_NAME=notset
    #   ;;
  esac
  echo "OS: $OS_NAME"
  # return OS_NAME
}
get_os
if [[ $OS_NAME == "osx" ]]; then
  printf "${BLUE}${BOLD}%s${NORMAL}\n" "$(sw_vers)"
else
  printf "${BLUE}${BOLD}%s${NORMAL}\n" "$(lsb_release -icrd)"
  fi

echo -e "\e[0;33m"

cat <<WARN
NOTICE:
To use 'gcloud'   : gcloud init
To use 'aws cli'  : aws configure
To use 'azure cli': azure login
WARN

# Turn off colors
echo -e "\e[m"
