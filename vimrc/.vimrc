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

"quickfix
autocmd FileType qf nnoremap <buffer> <CR> <CR>:cclose<CR>

"grep
call system('git rev-parse --is-inside-work-tree')
if v:shell_error == 0
  let &grepprg = 'git grep -I --line-number --column'
  set grepformat=%f:%l:%c:%m
elseif executable('rg')
  let &grepprg = 'rg --vimgrep --smart-case --hidden'
  set grepformat=%f:%l:%c:%m
endif
autocmd QuickFixCmdPost *grep* cwindow
command! -nargs=+ Grep silent! grep! <args>

