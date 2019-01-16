"
" Author: Yiran Li <yiranli91@gmail.com>
" Source: https://github.com/siurius/vimrc
" 
" tool: tools related to OS

scriptencoding utf-8

" projectroot
" nothing

" NERDTree
" executes toggle at root folder
map <silent> <F2> :ProjectRootExe NERDTreeToggle<CR>
let g:NERDTree_title = "[NERDTree]"

" TagBar
map <F3> :TagbarToggle<CR>
let g:tagbar_ctags_bin = 'ctags'
let g:tagbar_width = 40
" haskell needs lushtags

" ctrlsf.vim
let g:ctrlsf_default_root = 'project'
let g:ctrlsf_winsize = '30%'
vmap <leader>a <plug>CtrlSFVwordExec
map <F4> :CtrlSF -I<space>
" TODO: 1. highlight result window
"       2. line-wrap

" fzf
" automatic path completion
let g:fzf_action = {
      \ 'ctrl-l': 'split',
      \ 'ctrl-v': 'vsplit'
      \ }
nnoremap <leader>f :execute ':FZF '.projectroot#guess()<CR>
nnoremap <leader>hf :History<CR>
nnoremap <leader>hs :History/<CR>
nnoremap <leader>hc :History:<CR>
imap <c-x><c-l> <plug>(fzf-complete-line)
imap <c-x><c-f> <plug>(fzf-complete-path)

" AsyncRun
nmap <leader>r :AsyncRun<space>
nmap <leader>k :AsyncStop!<CR>

" vim-which-key
nnoremap <silent> <leader>      :<c-u>WhichKey ','<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey '<Space>'<CR>
" To register the descriptions when using the on-demand load feature, use the autocmd hook to call which#register(),
" e.g., register for the Space key(see more configuration details in the following sections):
" autocmd! User vim-which-key call which#register('<Space>', 'g:which_key_map')
