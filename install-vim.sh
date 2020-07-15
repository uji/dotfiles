#!/bin/sh
rm -rf ~/tmp/vim
git clone https://github.com/vim/vim.git ~/tmp/vim
cd ~/tmp/vim && ./configure \
  --prefix=/usr/local \
  --enable-multibyte \
  --enable-nls \
  --enable-cscope \
  --without-x \
  --disable-xim \
  --disable-gui \
  --disable-sysmouse \
  --disable-netbeans \
  --disable-xsmp \
  && make install
