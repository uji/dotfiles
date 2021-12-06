#!/bin/sh
set -e

use_package_manager() {
  UNAME=`uname`
  if type "brew" > /dev/null 2>&1; then
    brew install vim
    brew install tmux
  elif type "apt-get" > /dev/null 2>&1; then
    apt-get update
    apt-get install -y vim
  else
    echo "Your os is not supported."
  fi
}

use_package_manager

git clone https://github.com/uji/vimrc.git ~/dotfiles/vimrc
sh ~/dotfiles/vimrc/install.sh

mkdir -p ~/.config
ln -sf ~/dotfiles/vimrc/.vimrc ~/.vimrc
ln -sf ~/dotfiles/vimrc/vim ~/.vim
ln -sf ~/dotfiles/vimrc/vim ~/.config/nvim
ln -sf ~/dotfiles/vimrc/.vimrc ~/.config/nvim/init.vim
ln -sf ~/dotfiles/.bashrc ~/.bashrc
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
