let g:quickrun_config = {}
let g:quickrun_config['_'] = {
  \ 'runner': 'vimproc',
  \ 'runner/vimproc/updatetime' : 100
  \ }
let g:quickrun_config['ruby.rspec'] = {
  \ 'command': 'bundle',
  \ 'cmdopt': 'exec rspec'
  \ }
