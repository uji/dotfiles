runtime! init/*.vim
runtime! filetype/*.vim
runtime! mapping/*.vim
runtime! settings/*.vim
runtime! colors/*.vim
filetype plugin indent on
set shell=bash

set encoding=utf-8
scriptencoding utf-8
set fileformat=unix
setlocal ff=unix
set number
set relativenumber
set clipboard+=unnamed

set expandtab
set smarttab
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent
set hidden
set hlsearch
syntax enable
colorscheme nord

set ignorecase
set smartcase

set wildmenu

set noswapfile
set noundofile
set nobackup

augroup save
  autocmd BufWritePre * :%s/\s\+$//ge
augroup END
