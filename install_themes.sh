#!/bin/bash

set -e
# Pydemia-theme
# work_dir="$PWD"
# if [[ work_dir =~ pydemia-theme ]]; then
#   git clone https://github.com/pydemia/pydemia-theme $HOME/.pydemia-theme
#   source_dir="$HOME/.pydemia-theme"
# else
#   source_dir=$work_dir
# fi

# Get OS
get_os() {
  case $(uname | tr '[:upper:]' '[:lower:]') in
    linux*)
      OS_NAME=linux
      ;;
    darwin*)
      OS_NAME=osx
      ;;
    # msys*)
    #   export OS_NAME=windows
    #   ;;
    # *)
    #   export OS_NAME=notset
    #   ;;
  esac
  echo "$OS_NAME"
  # return OS_NAME
}

# Get Linux Distribution
get_distro() {
  OS_NAME="$(get_os)"
  if [[ $OS_NAME == "osx" ]]; then
    DIST_NAME="darwin"
  else
    DIST_NAME=`awk -F= '/^ID=/{print $2}' /etc/*-release | sed 's/\"//g'`
  fi;
  echo "$DIST_NAME"
  # return DIST_NAME
}

if [[ -d "$HOME/.pydemia-theme" ]]; then
  rm -rf $HOME/.pydemia-theme
fi
git clone https://github.com/pydemia/pydemia-theme $HOME/.pydemia-theme

SRC_DIR="$HOME/.pydemia-theme"
echo "SOURCE DIR: $SRC_DIR"

install_vim() {

  mkdir -p ~/.vim/colors
  mkdir -p ~/.vim/bundle

  curl -sL https://raw.githubusercontent.com/pydemia/pydemia-theme/master/vim/.vim/colors/cobalt2.vim -o ~/.vim/colors/cobalt2.vim
  if [[ -d "$HOME/.vim/bundle/Vundle.vim" ]]
  then
    rm -rf ~/.vim/bundle/Vundle.vim
  fi
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

  if [[ -f ~/.vimrc ]]; then
    mv ~/.vimrc ~/.vimrc.old
  fi
  curl -sL https://raw.githubusercontent.com/pydemia/pydemia-theme/master/vim/.vimrc -o ~/.vimrc

  #vim -u "~/.vimrc" +PlugInstall +qall > /dev/null
  vim -c 'PluginInstall' -c 'qa!'
  
  git clone https://github.com/rapphil/vim-python-ide.git vim-python-ide && \
  cd vim-python-ide && echo ""| echo ""| ./install.sh
  cd .. && rm -rf vim-python-ide && \
  sed -i 's/^colorscheme cobalt2/"colorscheme Monokai\ncolorscheme cobalt2/' ~/.vimrc
}

install_zsh() {

  OS_NAME="$(get_os)"
  if command -v zsh &> /dev/null
  then
    [[ $SHELL != /bin/zsh ]] && echo "Set 'zsh' as default shell..." && chsh -s $(which zsh)
  fi

  # Install Oh-My-Zsh
  exit | sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" || true

  # Install Fonts
  cd $HOME
  if [[ -d "$HOME/fonts" ]]
  then
    rm -rf $HOME/fonts
  fi
  git clone https://github.com/powerline/fonts.git --depth=1
  cd fonts
  ./install.sh
  cd ..
  rm -rf ./fonts

  ls -al  $SRC_DIR/zsh/.oh-my-zsh/themes/
  cp -rf $SRC_DIR/zsh/.oh-my-zsh/themes/* ~/.oh-my-zsh/themes/
  cp -rf $SRC_DIR/zsh/.pydemia-config ~/
  
  if [[ "$OS_NAME" = "linux" ]]; then
    sed -i 's/^ZSH_THEME=.*/ZSH_THEME="cobalt2-pydemia"/' ~/.zshrc
  elif [[ "$OS_NAME" = "osx" ]]; then
    sed -i '' 's/^ZSH_THEME=.*/ZSH_THEME="cobalt2-pydemia"/' ~/.zshrc
  fi

  # echo "$(cat $SRC_DIR/zsh/.zshrc)" >> ~/.zshrc
  # echo "source ~/.pydemia-config/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc
  # echo "source .pydemia-theme/.pydemia-config/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc:

  if [[ -f ~/.zcompdump ]]; then
    rm -f ~/.zcompdump*
  fi
  # if type -p java; then
  #   JAVA_HOME=`java -XshowSettings:properties -version 2>&1 > /dev/null | grep -E "java.home = ([^ ]*)$"|awk '{print $3}' |sed -n 's/\/jre$//p'`
  #   echo "export JAVA_HOME=\"$JAVA_HOME\"" >> ~/.bashrc;
  #   echo "export JAVA_HOME=\"$JAVA_HOME\"" >> ~/.zshrc;
  # fi
}

install_bash_theme() {
  OS_NAME="$(get_os)"
  
  if [[ -d "$HOME/.oh-my-bash" ]]; then
    rm -rf $HOME/.oh-my-bash
  fi
  exit | bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"

  cp -rf $SRC_DIR/bash/.oh-my-bash/themes/cobalt2-pydemia ~/.oh-my-bash/themes/
  # cp -r ~/.pydemia-theme/bash/.pydemia-config ~/
  # echo "source ~/.pydemia-config/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc
  #echo "source .pydemia-theme/.pydemia-config/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
  echo $OS_NAME
  if [ "$OS_NAME" = "linux" ]; then
    sed -i 's/^OSH_THEME=.*/OSH_THEME="cobalt2-pydemia"/' ~/.bashrc
  elif [ "$OS_NAME" = "osx" ]; then
    sed -i '' 's/^OSH_THEME=.*/OSH_THEME="cobalt2-pydemia"/' ~/.bash_profile
  fi

  # echo "$(cat $SRC_DIR/bash/.bashrc)" >> ~/.bash_profile

}

## Main Function
install_themes() {
  RETVAL=$?
  OS_NAME="$(get_os)"
  DIST_NAME="$(get_distro)"
  if ! command -v vim &> /dev/null
  then
    echo "`vim` not be found: skip settings for vim..."
  else
    install_vim
  fi
  
  if command -v zsh &> /dev/null
  then
    install_zsh
    exec zsh; source ~/.zshrc
  fi
  install_bash_theme
  exec bash; source ~/.bashrc
}

install_themes
