function! AddVimPlugin(arg) abort
  let args = split(a:arg, '/')
  echo system('cd $HOME/dotfile/vimrc')
  let cmd = join(['git submodule add -f https://github.com/', a:arg, ' .vim/pack/mypackage/start/', args[1]], '')
  echo system(cmd)
endfunction

" Usage: :AddVimPlugin {user_name}/{repo_name}
command! -nargs=1 AddVimPlugin :call AddVimPlugin(<f-args>)
