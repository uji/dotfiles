if &compatible
  set nocompatible
endif

let s:dein_dir = expand('~/.cache/.vim/dein')
let s:dein_repo_dir = expand('~/.cache/.vim/dein/repos/github.com/Shougo/dein.vim')

"let g:dein#types#git#default_protocol = "ssh"
if &runtimepath !~# 'dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim.git' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . s:dein_repo_dir
endif

let g:dein#auto_recache = 1

" 設定開始
if dein#load_state(s:dein_dir)

  let s:toml = [
        \ { 'name': 'default' },
        \ { 'name': 'lazy', 'lazy': 1 },
        \ { 'name': 'complete_lazy', 'lazy': 1 },
        \ ]

  let s:path = {name -> $HOME . '/dotfiles/.vim/init/' . name . '.toml'}
  let s:load_toml = {name, lazy -> dein#load_toml(s:path(name), {'lazy': lazy})}

  call dein#begin(s:dein_dir, map(deepcopy(s:toml), {_, t -> t['name']}))
  call map(s:toml, {_, t -> s:load_toml(t['name'], get(t, 'lazy', 0))})
  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif
