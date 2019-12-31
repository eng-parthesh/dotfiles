# Path to oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export TERM="xterm-256color"

plugins=(docker-compose ansible ant asdf autoenv aws boot2docker brew bundle capistrano cask copydir copyfile cp encode64 extract history kubectl osx rails sublime systemd tmux helm docker vagrant)

# Theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# Powerlevel9k
POWERLEVEL9K_MODE="nerdfont-complete"

# autocompletion
source <(kubectl completion zsh)
source <(bash completion zsh)

# source aliases
for i in $(ls ~/.aliases)
do
  . ~/.aliases/$i
done

# export
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

export GOPATH=$HOME/go >> ~/.zshrc
export PATH=$PATH:$GOPATH/bin >> ~/.zshrc
