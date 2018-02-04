"
" Author: Yiran Li <yiranli91@gmail.com>
" Source: https://github.com/siurius/vimrc
" 
" code: plugins for coding

scriptencoding utf-8

let g:ale_fixers = {
\   'python': ['autopep8', 'yapf'],
\}
" auto format
nmap <leader>= :ALEFix<CR>

