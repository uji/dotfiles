install:
	mkdir ~/tmp
	git clone https://github.com/vim/vim.git ~/tmp/vim
	git clone https://github.com/powerline/fonts.git ~/tmp/powerline_fonts --depth=1
	sh ~/tmp/powerline_fonts/install.sh

	# mac
	brew install fzf
	brew install universal-ctags
	brew install xonsh
	brew install bash-completion2
	brew install fish
	curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish

	# lsp
	gem install solargraph
	npm install -g typescript typescript-language-server
	npm install -g vue-language-server

	# go
	go get github.com/skanehira/translate.vim

vim:
	# vim build install 依存パッケージが必要
	cd ~/tmp/vim && ./configure \
		--prefix=/usr/local \
		--enable-multibyte \
		--enable-nls \
		--enable-perlinterp \
		--enable-python3interp --with-python3-command=/usr/local/bin/python3 \
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
		# --enable-pythoninterp --with-python-command=/usr/local/bin/python2 \
		# --enable-rubyinterp --with-ruby-command=/opt/local/bin/ruby2.5 \
		# --enable-tclinterp --with-tclsh=/usr/local/bin/tclsh \

deploy:
	ln -sf ~/dotfiles/.bash_profile ~/.bash_profile
	ln -sf ~/dotfiles/.bashrc ~/.bashrc
	ln -sf ~/dotfiles/.xonshrc ~/.xonshrc
	ln -sf ~/dotfiles/config.fish ~/.config/fish/config.fish
