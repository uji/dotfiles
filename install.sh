#!/bin/bash
set -e

use_package_manager() {
  UNAME=`uname`
  if type "brew" > /dev/null 2>&1; then
    brew install vim
    brew install tmux
  elif type "apt-get" > /dev/null 2>&1; then
    apt-get install -y libncurses5-dev

    # install ujivim
    curl -s https://api.github.com/repos/uji/ujivim/releases/latest \
    | grep "browser_download_url.*linux-amd64.tar.gz" \
    | cut -d : -f 2,3 \
    | tr -d \" \
    | xargs curl -o ~/ujivim.tar.gz -L
    tar -zxvf ~/ujivim.tar.gz -C ~/
    echo export PATH=$PATH:$HOME/ujivim/bin >> ~/.bash_local
    echo export VIM=$HOME/ujivim/share/vim >> ~/.bash_local
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

source ~/.bashrc

vim -c 'call minpac#clean()' \
    -c 'call minpac#update("", {"do": "quit"})' \
    -c ':q'
