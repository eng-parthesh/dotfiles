#!/bin/bash

set -e

# install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
chsh -s $(which zsh)

# install brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# update brew and install packages
brew update \
  && brew install git \
      wget \
      curl \
      tldr \
      vim \
      yq \
      tmux \
      tree \
      python \
      python3 \
      jq \
      kops \
      htop \
      awscli \
      git-lfs \
      telnet \
      shellcheck \
      kubernetes-cli \
      kubernetes-helm \
      bash-completion \
      zsh-syntax-highlighting \
      zsh-completions \
      zsh-autosuggestions

# install brew packages
brew cask install iterm2

# vundle install
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

#bash_completion setup
echo "[ -f /usr/local/etc/bash_completion ] \
		&& . /usr/local/etc/bash_completion" \
		>> ~/.bash_profile
