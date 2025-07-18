#!/bin/bash
set -eu

readonly DOTFILES_DIR="${HOME}/dotfiles"

[ ! -d ${DOTFILES_DIR} ] && \
  git clone https://github.com/uji/dotfiles.git ${DOTFILES_DIR} && \
  echo "source ${DOTFILES_DIR}/bashrc" >> "${HOME}/.bashrc"

# copy local setting files
[ ! -d ${HOME}/.tmux.conf.local ] && cp "${DOTFILES_DIR}/.tmux.conf.local.sample" "${HOME}/.tmux.conf.local"

# create symbolic link
mkdir -p "${HOME}/.config"
ln -sf "${DOTFILES_DIR}/vimrc/vim" "${HOME}/.vim"
ln -sf "${DOTFILES_DIR}/vimrc/vim" "${HOME}/.config/nvim"
ln -sf "${DOTFILES_DIR}/vimrc/.vimrc" "${HOME}/.vimrc"
ln -sf "${DOTFILES_DIR}/vimrc/.vimrc" "${HOME}/.config/nvim/init.vim"
ln -sf "${DOTFILES_DIR}/.tmux.conf" "${HOME}/.tmux.conf"

# install vim/neovim packages
mkdir -p "${DOTFILES_DIR}/vimrc/vim/pack/mypackage/opt"
[ ! -d ${DOTFILES_DIR}/vimrc/vim/pack/mypackage/opt/minpac ] && git clone https://github.com/k-takata/minpac.git "${DOTFILES_DIR}/vimrc/vim/pack/mypackage/opt/minpac"

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

# install tpm
[ ! -d ~/tmux/plugins/tpm ] && git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
