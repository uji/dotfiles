.PHONY: install
install: link

.PHONY: vim
vim:
	mkdir -p ~/tmp
	git clone https://github.com/vim/vim.git ~/tmp/vim
	cd ~/tmp/vim && ./configure \
		--prefix=/usr/local \
		--enable-multibyte \
		--enable-nls \
		--enable-perlinterp \
		--enable-python3interp --with-python3-command=`which python3` \
		--enable-luainterp --with-lua-prefix=/usr/local \
		--enable-cscope \
		--enable-fail-if-missing=yes \
		--with-features=huge \
		--with-luajit \
		--without-x \
		--disable-xim \
		--disable-gui \
		--disable-sysmouse \
		--disable-netbeans \
		--disable-xsmp \
		CC=`which clang` CFLAG='-I/usr/local/include' \
		&& make install

.PHONY: link
link:
	@sh link.sh

.PHONY: fish
fish:
	git clone https://github.com/powerline/fonts.git ~/tmp/powerline_fonts --depth=1
	sh ~/tmp/powerline_fonts/install.sh
	curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
	ln -sf ~/dotfiles/config.fish ~/.config/fish/config.fish
