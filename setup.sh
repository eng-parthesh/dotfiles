#!/bin/bash

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install git \
  vim \
  zsh \
  postgres \
  kubernetes-helm \
  kubernetes-cli \
  kubectl \
  pyenv \
  python \
  python@2 \
  mysql \
  docker \
  asdf \
  tldr \
  bash-completion || true

brew cask install iterm2 \
  visual-studio-code \
  java \
  sublime-text \
  virtualbox \
  google-chrome \
  google-hangouts \
  vagrant-manager \
  vagrant \
  mark-text || true

brew update

# bash
echo "[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion" >> ~/.bash_profile

# zsh
chsh -s /bin/zsh

# python
echo 'eval "$(pyenv init -)"' >> ~/.bash_profile

# install pip
curl https://bootstrap.pypa.io/get-pip.py > get-pip.py || true
sudo python get-pip.py
pip --version
pip install virtualenv
rm get-pip.py

# powerlevel10k theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git 
mv powerlevel10k ~/.oh-my-zsh/themes/powerlevel10k || true
rm -rf powerlevel10k || true

# copy ~/.
cp .zshrc ~/.zshrc

# asdf
echo -e "\n. $(brew --prefix asdf)/asdf.sh" >> ~/.zshrc
echo -e "\n. $(brew --prefix asdf)/etc/bash_completion.d/asdf.bash" >> ~/.zshrc

# GOPATH
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# aws-iam-authenticator
go get -u -v sigs.k8s.io/aws-iam-authenticator/cmd/aws-iam-authenticator || true

source ~/.zshrc
#source ~/.bash_profile
