#!/bin/bash

# Pydemia-theme
git clone https://github.com/pydemia/pydemia-theme ~/.pydemia-theme

install_vim() {

  mkdir -p ~/.vim/colors
  mkdir -p ~/.vim/bundle

  curl -sL https://raw.githubusercontent.com/pydemia/pydemia-theme/master/vim/.vim/colors/cobalt2.vim -o ~/.vim/colors/cobalt2.vim
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

  cp ~/.vimrc ~/.vimrc.old
  curl -sL https://raw.githubusercontent.com/pydemia/pydemia-theme/master/vim/.vimrc -o ~/.vimrc

  #vim -u "~/.vimrc" +PlugInstall +qall > /dev/null
  vim -c 'PluginInstall' -c 'qa!'
}

install_zsh() {

  chsh -s $(which zsh)

  # Install Oh-My-Zsh
  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" || true

  # Install Fonts
  cd ~/
  git clone https://github.com/powerline/fonts.git --depth=1
  cd fonts
  ./install.sh
  cd ..
  rm -rf ./fonts

  cp ~/.pydemia-theme/zsh/.oh-my-zsh/themes/cobalt2-pydemia.zsh-theme ~/.oh-my-zsh/themes/
  cp -r ~/.pydemia-theme/zsh/.pydemia-config ~/
  
  if [ "$OS_NAME" = "linux" ]; then
    sed -i 's/^ZSH_THEME*/#&/' ~/.zshrc
  elif [ "$OS_NAME" = "osx" ]; then
    sed -i '' 's/^ZSH_THEME*/#&/' ~/.zshrc
  fi

  cat ~/.pydemia-theme/zsh/.zshrc >> ~/.zshrc
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

  cp -r ~/.pydemia-theme/bash/.oh-my-bash/themes/cobalt2-pydemia ~/.oh-my-bash/themes/
  # cp -r ~/.pydemia-theme/bash/.pydemia-config ~/
  # echo "source ~/.pydemia-config/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc
  #echo "source .pydemia-theme/.pydemia-config/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc

  if [ "$OS_NAME" = "linux" ]; then
    sed -i 's/^OSH_THEME*/#&/' ~/.bashrc
  elif [ "$OS_NAME" = "osx" ]; then
    sed -i '' 's/^OSH_THEME*/#&/' ~/.bash_profile
  fi

  cat ~/.pydemia-theme/bash/.bashrc >> ~/.bash_profile

}

rm -rf ~/.pydemia-theme

## Main Function
install_themes() {
  RETVAL=$?
  install_vim
  install_zsh
  install_bash_theme
}

install_themes
