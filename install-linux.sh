#!/bin/sh
if type "apt-get" > /dev/null 2>&1; then
  apt-get update
  apt-get install -y vim silversearcher-ag
fi

sh ~/dotfiles/common.sh
sh ~/dotfiles/ln.sh
sh ~/dotfiles/install-vimpack.sh
