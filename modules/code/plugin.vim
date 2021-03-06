"
" Author: Yiran Li <yiranli91@gmail.com>
" Source: https://github.com/siurius/vimrc
" 
" code: plugins for coding

scriptencoding utf-8

" {neo}vim LSP
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" vim snippets
Plug 'honza/vim-snippets'
" Codi, scratchpad
Plug 'metakirby5/codi.vim'
" vim-slime, select and run
Plug 'jpalardy/vim-slime'
" any-jump
Plug 'pechorin/any-jump.vim'

" " Asynchronous Lint Engine 
" Plug 'w0rp/ale'
" " YouCompleteMe
" Plug 'Valloric/YouCompleteMe'
" " YCM-Generator
" Plug 'rdnetto/YCM-Generator', {'branch': 'stable'}
" " haskell syntx highlight
" Plug 'neovimhaskell/haskell-vim'
" " haskell tagbar
" Plug 'bitc/lushtags'
" " haskell API reference
" Plug 'Twinside/vim-hoogle'

" removed
" vimproc, asynchronous execution library required by neco-ghc, not required anymore
" Plug 'Shougo/vimproc.vim'
" REMOVE, require ghc-mod haskell completion
" Plug 'eagletmt/neco-ghc'
" better haskell looking
" Plug 'enomsg/vim-haskellConcealPlus'
" TabNine completor
" Plug 'zxqfl/tabnine-vim'
