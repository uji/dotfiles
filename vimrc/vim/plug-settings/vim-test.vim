if has('nvim')
  let test#strategy = "neovim"
  let test#neovim#term_position = "vert rightbelow"
  let test#neovim#start_normal = 1
else
  let test#strategy = "vimterminal"
  let test#vim#term_position = "vert rightbelow"
  let test#vimterminal#start_normal = 1
endif

nmap <Leader>tn :TestNearest<CR>
nmap <Leader>tl :TestLast<CR>
nmap <Leader>tf :TestFile<CR>
