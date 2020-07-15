#!/bin/sh
if type "apt-get" > /dev/null 2>&1; then
  apt-get update
  apt-get install -y silversearcher-ag
fi

sh ~/dotfiles/install-vim.sh
sh ~/dotfiles/common.sh
sh ~/dotfiles/ln.sh
sh ~/dotfiles/install-vimpack.sh
