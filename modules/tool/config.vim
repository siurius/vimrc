"
" Author: Yiran Li <yiranli91@gmail.com>
" Source: https://github.com/siurius/vimrc
" 
" tool: tools related to OS

scriptencoding utf-8

" NERDTree
map <silent> <F2> :NERDTreeToggle<CR>
let g:NERDTree_title = "[NERDTree]"

" TagBar
map <F3> :TagbarToggle<CR>
let g:tagbar_ctags_bin = 'ctags'
let g:tagbar_width = 40
" haskell needs lushtags

" ctrlsf.vim
let g:ctrlsf_default_root = 'project'
let g:ctrlsf_winsize = '30%'
vmap <leader>a <Plug>CtrlSFVwordExec
map <F4> :CtrlSF<space>
" TODO: highlight result window
