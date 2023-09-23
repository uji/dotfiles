runtime! mapping/*.vim
runtime! plug-settings/*.vim
runtime! command/*.vim
runtime! language/*.vim
runtime local.vim
filetype plugin indent on
set shell=bash

set encoding=utf-8
scriptencoding utf-8
set fileformat=unix
setlocal ff=unix
set clipboard+=unnamedplus
let g:clipboard = {
\   'name': 'WslClipboard',
\   'copy': {
\      '+': 'clip.exe',
\      '*': 'clip.exe',
\    },
\   'paste': {
\      '+': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
\      '*': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
\   },
\   'cache_enabled': 0,
\ }

set expandtab
set smarttab
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent
set hidden
set hlsearch
syntax enable
set synmaxcol=320

if !empty(globpath(&rtp, 'pack/minpac/start/nord-vim'))
  colorscheme nord
endif
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

set ignorecase
set smartcase

set wildmenu
set wildmode=longest,full

set noswapfile
set noundofile
set nobackup

augroup save
  autocmd BufWritePre * :%s/\s\+$//ge
augroup END
