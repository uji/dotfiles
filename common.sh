#!/bin/sh
echo 'export PS1="$(pwd)$ "' >> ~/.bash_profile
git clone https://github.com/uji/vimrc.git ~/dotfiles/vimrc
sh ~/dotfiles/vimrc/install.sh
