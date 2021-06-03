#!/bin/sh
if type "apt-get" > /dev/null 2>&1; then
  apt-get update
  apt-get install -y libncurses5-dev silversearcher-ag
fi

curl -s https://api.github.com/repos/uji/ujivim/releases/latest \
| grep "browser_download_url.*linux-amd64.tar.gz" \
| cut -d : -f 2,3 \
| tr -d \" \
| xargs curl -o ~/ujivim.tar.gz -L

tar -zxvf ~/ujivim.tar.gz -C ~

sh ~/dotfiles/common.sh
sh ~/dotfiles/ln.sh
sh ~/dotfiles/install-vimpack.sh
