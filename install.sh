#!/bin/bash
set -eu

DOTFILES_DIR="${HOME}/dotfiles"

git clone https://github.com/uji/dotfiles.git ${DOTFILES_DIR}
[ ! -d /usr/share/bash-completion ] && git clone --depth 1 https://github.com/scop/bash-completion.git /usr/share/bash-completion

# copy local setting files
cp ~/dotfiles/.tmux.conf.local.sample ~/.tmux.conf.local

# create symbolic link
mkdir -p ~/.config
ln -sf ~/dotfiles/vimrc/.vimrc ~/.vimrc
ln -sf ~/dotfiles/vimrc/vim ~/.vim
ln -sf ~/dotfiles/vimrc/vim ~/.config/nvim
ln -sf ~/dotfiles/vimrc/.vimrc ~/.config/nvim/init.vim
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf

# install vim/neovim packages
mkdir -p "${DOTFILES_DIR}/vimrc/vim/pack/mypackage/opt"
git clone https://github.com/k-takata/minpac.git "${DOTFILES_DIR}/vimrc/vim/pack/mypackage/opt/minpac"

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

# source from ~/.bashrc
echo "source ${DOTFILES_DIR}/bashrc" >> ~/.bashrc
