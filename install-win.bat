git clone https://github.com/uji/vimrc.git %HOMEPATH%"/dotfiles/vimrc"
mklink %HOMEPATH%"\_vimrc" %HOMEPATH%"\dotfiles\vimrc\.vimrc"
mklink %HOMEPATH%"\.gvimrc" %HOMEPATH%"\dotfiles\vimrc\.gvimrc"
mklink /D %HOMEPATH%"\vimfiles" %HOMEPATH%"\dotfiles\vimrc\vim"
mkdir -p %HOMEPATH%"/dotfiles/vimrc/vim/pack/mypackage/opt"
git clone https://github.com/k-takata/minpac.git %HOMEPATH%/dotfiles/vimrc/vim/pack/mypackage/opt/minpac
exit 0
