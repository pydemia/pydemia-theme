#!/bin/bash

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

# Get Linux Distribution
get_distro() {
  if [[ $OS_NAME == "osx" ]]; then
    DIST_NAME="darwin"
  else
    DIST_NAME=`awk -F= '/^ID=/{print $2}' /etc/*-release | sed 's/\"//g'`
  fi;
  echo "Distro: $DIST_NAME"
  # return DIST_NAME
}

# Get Package Manager
get_package_manager() {
  case "$DIST_NAME" in
    "ubuntu") pkgmgr="apt-get" ;;
    "centos") pkgmgr="yum" ;;
    "centos") pkgmgr="brew" ;;
  esac
}

get_base() {
  # Install Dev Tools
  if [ "$DIST_NAME" = "ubuntu" ]; then
    sed -i 's/^override*/#&/' /etc/yum.conf
  fi

  $pkgmgr update -y
  $pkgmgr install vim zsh curl wget git man htop -y
  if [ "$DIST_NAME" = "ubuntu" ]; then
    $pkgmgr install build-essential -y
    $pkgmgr install python3 -y
  elif [ "$DIST_NAME" = "centos" ]; then
    $pkgmgr group mark install "Development Tools"
    $pkgmgr group update "Development Tools"
    $pkgmgr groupinstall -y 'development tools'
    $pkgmgr install sudo -y
    $pkgmgr install python36u python36u-libs python36u-devel python36u-pip -y
  fi

  $pkgmgr update -y

  # Set Locales
  # LOCALE=ko_KR
  if [ "$DIST_NAME" = "ubuntu" ]; then
    $pkgmgr install locales -y
    echo "LANG=$LOCALE.UTF-8"
    locale-gen $LOCALE.UTF-8
    update-locale LANG=$LOCALE.UTF-8 LC_ALL=$LOCALE.UTF-8; echo "$(locale)"
    #export LANG=$LOCALE.UTF-8; echo "$(locale)"
    #export LC_ALL=$LOCALE.UTF-8; echo $LC_ALL


    ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime
  elif [ "$DIST_NAME" = "centos" ]; then
    sed -i 's/^override*/#&/' /etc/yum.conf
    echo "LANG=$LOCALE.utf8" > /etc/locale.conf
    $pkgmgr reinstall glibc-common glibc -y

    localedef -f UTF-8 -i $LOCALE $LOCALE.utf8
    echo "RUN LANG"
    export LANG=$LOCALE.utf8; echo "$(locale)"
    export LC_ALL=$LOCALE.utf8; echo $LC_ALL

    ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime

  fi

  # Install sudo
  $pkgmgr update -y
  $pkgmgr install sudo -y

  # Install JDK
  if [ "$DIST_NAME" = "ubuntu" ]; then
    $pkgmgr install openjdk-8-jdk -y --fix-missing
  elif [ "$DIST_NAME" = "centos" ]; then
    $pkgmgr install java-1.8.0-openjdk java-1.8.0-openjdk-devel -y
  fi

  echo "$(which java)"

  JAVA_HOME=`java -XshowSettings:properties -version 2>&1 > /dev/null | grep -E "java.home = ([^ ]*)$"|awk '{print $3}' |sed -n 's/\/jre$//p'`
  if [ "$DIST_NAME" = "ubuntu" ]; then
    echo "export JAVA_HOME=\"$JAVA_HOME\"" >> /etc/bash.bashrc
  elif [ "$DIST_NAME" = "centos" ]; then
    echo "export JAVA_HOME=\"$JAVA_HOME\"" >> /etc/bashrc
  fi

}

install_vim() {
  $pkgmgr install vim ctags -y

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
  if [[ -n $(which zsh) ]]; then
    $pkgmgr install zsh -y
  fi
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

  # Pydemia-theme
  git clone https://github.com/pydemia/pydemia-theme ~/.pydemia-theme
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

  rm -rf ~/.pydemia-theme

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

  git clone https://github.com/pydemia/pydemia-theme ~/.pydemia-theme
  cp -r ~/.pydemia-theme/bash/.oh-my-bash/themes/cobalt2-pydemia ~/.oh-my-bash/themes/
  # cp -r ~/.pydemia-theme/bash/.pydemia-config ~/
  # echo "source ~/.pydemia-config/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc
  #echo "source .pydemia-theme/.pydemia-config/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc

  # Install `gdircolors`: GNU `dircolors` alternative
  if [ "$OS_NAME" = "osx" ]; then
    $pkgmgr install coreutils
  fi
  ln -s /usr/local/bin/gdircolors /usr/local/bin/dircolors


  if [ "$OS_NAME" = "linux" ]; then
    sed -i 's/^OSH_THEME*/#&/' ~/.bashrc
  elif [ "$OS_NAME" = "osx" ]; then
    sed -i '' 's/^OSH_THEME*/#&/' ~/.bash_profile
  fi

  cat ~/.pydemia-theme/bash/.bashrc >> ~/.bash_profile

  rm -rf ~/.pydemia-theme

}


## Main Function
build_prompt() {
  RETVAL=$?
  get_os
  get_distro
  get_package_manager
  get_base
  install_vim
  install_zsh
  install_bash_theme
}

build_prompt
