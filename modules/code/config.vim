"
" Author: Yiran Li <yiranli91@gmail.com>
" Source: https://github.com/siurius/vimrc
" 
" code: plugins for coding

scriptencoding utf-8

" ALE
let g:ale_fixers = {
\   'python': ['autopep8', 'yapf'],
\}
" auto format
nmap <leader>= :ALEFix<CR>
let g:airline#extensions#ale#enabled = 1
" change ALE sign
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
nmap <c-k> <Plug>(ale_previous_wrap)
nmap <c-j> <Plug>(ale_next_wrap)
