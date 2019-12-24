let g:neoterm_default_mod='belowright'
let g:neoterm_rspec_cmd='bin/rspec'
let g:neoterm_autoscroll=1

map <Leader>a :TermRSpecAll<CR>
map <Leader>f :TermRSpecFile<CR>
map <Leader>n :TermRSpecLine<CR>
map <Leader>x :Ttoggle<CR>

command! TermRSpecAll : call neoterm#do({ 'cmd': g:neoterm_rspec_cmd })
command! TermRSpecFile : call TermRSpecFile()
command! TermRSpecLine : call TermRSpecLine()

function! TermRSpecFile()
  let s:filename = expand('%')
  call neoterm#do({ 'cmd': join([g:neoterm_rspec_cmd, s:filename]) })
endfunction

function! TermRSpecLine()
  let s:filename = expand('%')
  let s:opt = join([s:filename, line('.')], ':')
  call neoterm#do({ 'cmd': join([g:neoterm_rspec_cmd, s:opt]) })
endfunction
