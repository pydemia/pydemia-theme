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
    "darwin")
      pkgmgr="brew"
      if ! [ -x "$(command -v ${pkgmgr})" ]; then
        bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
      fi
    ;;
  esac
}

get_base() {

  # Install sudo
  if [[ $DIST_NAME != "darwin" ]]; then
    sudo $pkgmgr update -y
    sudo $pkgmgr install sudo -y
  fi

  # Install Dev Tools
  if [[ $OS_NAME == "linux" ]]; then
    sudo $pkgmgr update -y
    sudo $pkgmgr install vim zsh curl wget git man htop -y
    if [ "$DIST_NAME" = "ubuntu" ]; then
      sudo $pkgmgr install build-essential -y
      sudo $pkgmgr install python3 -y
    elif [ "$DIST_NAME" = "centos" ]; then
      sed -i 's/^override*/#&/' /etc/yum.conf
      sudo $pkgmgr group mark install "Development Tools"
      sudo $pkgmgr group update "Development Tools"
      sudo $pkgmgr groupinstall -y 'development tools'
      sudo $pkgmgr install sudo -y
      sudo $pkgmgr install python36u python36u-libs python36u-devel python36u-pip -y
    fi

    sudo $pkgmgr update -y
  fi

  # Set Locales
  # LOCALE=ko_KR
  if [ "$DIST_NAME" = "ubuntu" ]; then
    sudo $pkgmgr install locales -y
    echo "LANG=$LOCALE.UTF-8"
    sudo locale-gen $LOCALE.UTF-8
    sudo update-locale LANG=$LOCALE.UTF-8 LC_ALL=$LOCALE.UTF-8; echo "$(locale)"
    #export LANG=$LOCALE.UTF-8; echo "$(locale)"
    #export LC_ALL=$LOCALE.UTF-8; echo $LC_ALL

    sudo ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime

  elif [ "$DIST_NAME" = "centos" ]; then
    sudo sed -i 's/^override*/#&/' /etc/yum.conf
    sudo echo "LANG=$LOCALE.utf8" > /etc/locale.conf
    sudo $pkgmgr reinstall glibc-common glibc -y

    sudo localedef -f UTF-8 -i $LOCALE $LOCALE.utf8
    echo "RUN LANG"
    export LANG=$LOCALE.utf8; echo "$(locale)"
    export LC_ALL=$LOCALE.utf8; echo $LC_ALL

    sudo ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime

  fi

  # Install JDK
  if [ "$DIST_NAME" = "ubuntu" ]; then
    # $pkgmgr install openjdk-8-jdk -y --fix-missing
    wget -qO - https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public | sudo apt-key add -
    sudo add-apt-repository --yes https://adoptopenjdk.jfrog.io/adoptopenjdk/deb/
    sudo $pkgmgr update -y
    sudo $pkgmgr install adoptopenjdk-14-hotspot

  elif [ "$DIST_NAME" = "centos" ]; then
    repo_str="[AdoptOpenJDK]
name=AdoptOpenJDK
baseurl=http://adoptopenjdk.jfrog.io/adoptopenjdk/rpm/centos/$releasever/$basearch
enabled=1
gpgcheck=1
gpgkey=https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public"
    sudo echo $repo_str >> /etc/yum.repos.d/adoptopenjdk.repo
    sudo $pkgmgr update -y
    sudo $pkgmgr install adoptopenjdk-14-hotspot
  fi

  echo "$(which java)"

  JAVA_HOME=`java -XshowSettings:properties -version 2>&1 > /dev/null | grep -E "java.home = ([^ ]*)$"|awk '{print $3}' |sed -n 's/\/jre$//p'`
  if [ "$DIST_NAME" = "ubuntu" ]; then
    sudo echo "export JAVA_HOME=\"$JAVA_HOME\"" >> /etc/bash.bashrc
  elif [ "$DIST_NAME" = "centos" ]; then
    sudo echo "export JAVA_HOME=\"$JAVA_HOME\"" >> /etc/bashrc
  fi

  if [[ $OS_NAME == "linux" ]]; then
    sudo $pkgmgr install vim ctags -y
    if [[ -n $(which zsh) ]]; then
      sudo $pkgmgr install zsh -y
      # to avoid chsh:PAM authentication failed: /etc/pam.d/chsh
      sed -i "s/^auth.*pam_shells.so/^#auth.*pam_shells.so/g" /etc/pam.d/chsh
    fi
  fi

  # Install `gdircolors`: GNU `dircolors` alternative
  if [[ "$DIST_NAME" = "darwin" && ! -x "$(which dircolors)" ]]; then
    sudo $pkgmgr install coreutils
    ln -s /usr/local/bin/gdircolors /usr/local/bin/dircolors
  fi

}


## Main Function
setup() {
  RETVAL=$?
  get_os
  get_distro
  get_package_manager
  get_base
}

setup
