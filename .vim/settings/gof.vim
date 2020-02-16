if executable('gof')
  command! -nargs=* Gof term ++close gof -t

  if !has("nvim")
    nnoremap <C-p> :Gof i<CR>
  endif
endif
