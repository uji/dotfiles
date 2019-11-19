autocmd VimEnter * call coc#rpc#start_server()

let g:coc_global_extensions = ['coc-json']
let g:coc_global_extensions = ['coc-solargraph']
let g:coc_global_extensions = ['coc-python']

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
