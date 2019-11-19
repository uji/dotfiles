augroup filetypedetect
  au!
  au BufRead, BufNewFile *.rb *.erb setf ruby
  au BufWinEnter,BufNewFile *_spec.rb setf ruby.rspec
  au BufNewFile,BufRead *.py,*.pyw,.pythonstartup,.pythonrc,*.ptl,.xonshrc  setf python
augroup END
