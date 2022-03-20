#!/bin/bash
set -e

touch ~/.bash_local

[ ! -d /usr/share/bash-completion ] && git clone --depth 1 https://github.com/scop/bash-completion.git /usr/share/bash-completion

if type "brew" > /dev/null 2>&1; then
  brew install neovim
  brew install tmux
elif type "apt-get" > /dev/null 2>&1; then
  curl -s https://api.github.com/repos/neovim/neovim/releases/latest \
  | grep "browser_download_url.*nvim.appimage\"" \
  | cut -d : -f 2,3 \
  | tr -d \" \
  | xargs curl -o ~/nvim.appimage -L
  chmod u+x ~/nvim.appimage
  ~/nvim.appimage --appimage-extract
  mv squashfs-root /usr/local/neovim
  echo export PATH=\"$PATH:/usr/local/neovim/usr/bin\" >> ~/.bash_local
  rm ~/nvim.appimage
else
  echo "required brew or apt-get."
fi

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
