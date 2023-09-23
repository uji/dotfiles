#!/bin/bash
set -e

touch ~/.bash_local

[ ! -d /usr/share/bash-completion ] && git clone --depth 1 https://github.com/scop/bash-completion.git /usr/share/bash-completion

git clone https://github.com/uji/vimrc.git ~/dotfiles/vimrc
sh ~/dotfiles/vimrc/install.sh

cp ~/dotfiles/.tmux.conf.local.sample ~/.tmux.conf.local

mkdir -p ~/.config
ln -sf ~/dotfiles/vimrc/.vimrc ~/.vimrc
ln -sf ~/dotfiles/vimrc/vim ~/.vim
ln -sf ~/dotfiles/vimrc/vim ~/.config/nvim
ln -sf ~/dotfiles/vimrc/.vimrc ~/.config/nvim/init.vim
ln -sf ~/dotfiles/.bashrc ~/.bashrc
ln -sf ~/dotfiles/.bashrc ~/.zshrc
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
. ~/.bashrc

if type "nvim" > /dev/null 2>&1; then
  git config --global core.editor nvim
  nvim -c 'call minpac#clean()' \
      -c 'call minpac#update("", {"do": "quit"})' \
      -c ':q'
else
  git config --global core.editor vim
  vim -c 'call minpac#clean()' \
      -c 'call minpac#update("", {"do": "quit"})' \
      -c ':q'
fi
