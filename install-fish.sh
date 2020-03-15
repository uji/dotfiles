#!/bin/sh
git clone https://github.com/powerline/fonts.git ~/tmp/powerline_fonts --depth=1
sh ~/tmp/powerline_fonts/install.sh
curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
ln -sf ~/dotfiles/fish/config.fish ~/.config/fish/config.fish
