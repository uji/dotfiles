let g:ale_fixers = {
      \ 'ruby': ['rubocop'],
      \ 'python': ['autopep8', 'black', 'isort'],
      \ }

let g:ale_ruby_rubocop_executable = 'bundle'
