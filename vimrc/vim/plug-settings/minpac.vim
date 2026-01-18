packadd minpac

call minpac#init()

call minpac#add('k-takata/minpac', {'type': 'opt'})

call minpac#add('tpope/vim-abolish')
call minpac#add('tpope/vim-surround')
call minpac#add('tpope/vim-rhubarb')
call minpac#add('ctrlpvim/ctrlp.vim')
call minpac#add('prabirshrestha/vim-lsp')
call minpac#add('mattn/vim-lsp-settings')
call minpac#add('easymotion/vim-easymotion')
call minpac#add('vim-test/vim-test')
"when develop with ssh remote url, run `git remote set-url origin git@github.com:uji/vim-github-url.git`
call minpac#add('uji/vim-github-url')
