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

if [ -d "$HOME/.pydemia-theme" ]; then
  rm -rf $HOME/.pydemia-theme
fi
git clone https://github.com/pydemia/pydemia-theme $HOME/.pydemia-theme

ls -al $SRC_DIR
SRC_DIR="$HOME/.pydemia-theme"
echo "SOURCE DIR: $SRC_DIR"

install_vim() {

  mkdir -p ~/.vim/colors
  mkdir -p ~/.vim/bundle

  curl -sL https://raw.githubusercontent.com/pydemia/pydemia-theme/master/vim/.vim/colors/cobalt2.vim -o ~/.vim/colors/cobalt2.vim
  if [ -d "$HOME/.vim/bundle/Vundle.vim" ]
  then
    rm -rf ~/.vim/bundle/Vundle.vim
  fi
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

  if [[ -f ~/.vimrc ]]; then
    ~/.vimrc.old
  fi
  curl -sL https://raw.githubusercontent.com/pydemia/pydemia-theme/master/vim/.vimrc -o ~/.vimrc

  #vim -u "~/.vimrc" +PlugInstall +qall > /dev/null
  vim -c 'PluginInstall' -c 'qa!'
}

install_zsh() {

  [[ $SHELL != /bin/zsh ]] && echo "Set 'zsh' as default shell..." && chsh -s $(which zsh)

  # Install Oh-My-Zsh
  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" || true

  # Install Fonts
  cd $HOME
  if [ -d "$HOME/fonts" ]
  then
    rm -rf $HOME/fonts
  fi
  git clone https://github.com/powerline/fonts.git --depth=1
  cd fonts
  ./install.sh
  cd ..
  rm -rf ./fonts

  ls -al  $SRC_DIR/zsh/.oh-my-zsh/themes/
  cp $SRC_DIR/zsh/.oh-my-zsh/themes/* ~/.oh-my-zsh/themes/
  cp -rf $SRC_DIR/zsh/.pydemia-config ~/
  
  if [ "$OS_NAME" = "linux" ]; then
    sed -i 's/^ZSH_THEME=.*/ZSH_THEME="cobalt2-pydemia"/' ~/.zshrc
  elif [ "$OS_NAME" = "osx" ]; then
    sed -i '' 's/^ZSH_THEME=.*/ZSH_THEME="cobalt2-pydemia"/' ~/.zshrc
  fi

  # echo "$(cat $SRC_DIR/zsh/.zshrc)" >> ~/.zshrc
  # echo "source ~/.pydemia-config/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc
  # echo "source .pydemia-theme/.pydemia-config/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc:

  if [ -f ~/.zcompdump ]; then
    rm -f ~/.zcompdump*
  fi
  # if type -p java; then
  #   JAVA_HOME=`java -XshowSettings:properties -version 2>&1 > /dev/null | grep -E "java.home = ([^ ]*)$"|awk '{print $3}' |sed -n 's/\/jre$//p'`
  #   echo "export JAVA_HOME=\"$JAVA_HOME\"" >> ~/.bashrc;
  #   echo "export JAVA_HOME=\"$JAVA_HOME\"" >> ~/.zshrc;
  # fi
}

install_bash_theme() {
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"

  cp -rf $SRC_DIR/bash/.oh-my-bash/themes/cobalt2-pydemia ~/.oh-my-bash/themes/
  # cp -r ~/.pydemia-theme/bash/.pydemia-config ~/
  # echo "source ~/.pydemia-config/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc
  #echo "source .pydemia-theme/.pydemia-config/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc

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
  if ! command -v vim &> /dev/null
  then
      echo "`vim` not be found: skip settings for vim..."
  else
    install_vim
  fi
  install_zsh
  install_bash_theme
}

install_themes
