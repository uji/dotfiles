let g:rspec_command = "!bin/rspec {spec}"

" RSpec.vim mappings
map <Leader>f :call RunCurrentSpecFile()<CR>
map <Leader>n :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
