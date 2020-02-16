let g:fzf_action = {
  \ 'ctrl-s': 'split' }

if has("nvim")
  nnoremap <C-p> :FZFFileList<CR>
endif

command! FZFFileList call fzf#run(fzf#wrap({
            \ 'source': 'find . -type d -name .git -prune -o ! -name .DS_Store',
            \ 'down': '40%'}))

nnoremap <C-b> :Buffers<CR>
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)
nnoremap <C-g> :Ag<CR>
nnoremap <silent> <C-]> :call fzf#vim#tags(expand('<cword>'))<CR>

let g:fzf_buffers_jump = 1

command! -bang -nargs=? -complete=dir Files
            \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
