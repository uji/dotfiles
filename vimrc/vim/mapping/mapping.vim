let mapleader = "\<Space>"
inoremap <C-[> <ESC>

inoremap <expr> <Tab>   pumvisible() ? "\<c-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<c-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<c-y>" : "\<cr>"

"terminal
tnoremap <silent> <C-[> <C-\><C-n>
