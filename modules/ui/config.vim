"
" Author: Yiran Li <yiranli91@gmail.com>
" Source: https://github.com/siurius/vimrc
" 
" ui.vim: user interface

scriptencoding utf-8

" set theme
set background=dark            " set a dark background
set t_Co=256                   " 256 colors for the terminal
if has('gui_running')
    colorscheme molokai
else
    colorscheme molokai256
endif

" airline setting
set noshowmode  " remove --INSERT-- etc.
let g:airline_theme='powerlineish'
let g:airline_powerline_fonts=1
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#hunks#non_zero_only = 1
" let g:airline#extensions#tabline#enabled = 2
" let g:airline#extensions#tabline#fnamemod = ':t'
" let g:airline#extensions#tabline#buffer_min_count = 1

" airline theme
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ 11

" Remove cursor and line highlight from inactive windows
augroup DimInactiveWindows
  au!
  "au WinEnter * call s:DimInactiveWindows()
  "au WinEnter * call s:SetCurrentWindow()
  au WinEnter * set cursorline
  au WinLeave * set nocursorline
augroup END
