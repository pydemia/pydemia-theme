# ZSH

## Installation

```sh
sudo apt install zsh
chsh -s /usr/bin/zsh
```

## Customization

### Oh-My-Zsh

```sh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```


### Fonts

```sh
cd ~/git
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts
```

### Syntax Highlighting

[iTerm2-Color-Schemes](https://github.com/mbadolato/iTerm2-Color-Schemes)

```sh
cd ~/git
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
```

### (On MAC)

```sh
#brew install gdircolors
brew install coreutils

ln -s /usr/local/bin/gdircolors /usr/local/bin/dircolors
```

[`.zshrc`](.zshrc)

```sh
 sudo apt-get install dconf-cli uuid-runtime
 
```
