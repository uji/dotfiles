#!/bin/sh
sh ~/dotfiles/install-vim.sh
sh ~/dotfiles/common.sh
sh ~/dotfiles/ln.sh
sh ~/dotfiles/install-vimpack.sh
brew install tmux

source ~/.bashrc
