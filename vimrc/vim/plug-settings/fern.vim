nmap <silent><leader>e :Fern . -reveal=% -drawer -toggle<CR>

function! s:init_fern() abort
  nmap <buffer> <Plug>(fern-action-open) <Plug>(fern-action-open:select)
  nmap <buffer><nowait> D <Plug>(fern-action-remove)
endfunction

augroup fern-custom
  autocmd! *
  autocmd FileType fern call s:init_fern()
augroup END
