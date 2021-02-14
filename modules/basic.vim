scriptencoding utf-8
"
" Author: Yiran Li <yiranli91@gmail.com>
" Source: https://github.com/siurius/vimrc
" 
" basic.vim: minimal acceptable git configuration without any heavy plugins

" Basic options {{{

set encoding=utf-8              " setup the encoding to UTF-8
set ls=2                        " status line always visible
set go-=T                       " hide the toolbar
set go-=m                       " hide the menu
" The next two lines are quite tricky, but in Gvim, if you don't do this, if you
" only hide all the scrollbars, the vertical scrollbar is showed anyway
set go+=rRlLbh                  " show all the scrollbars
set go-=rRlLbh                  " hide all the scrollbars
set visualbell                  " turn on the visual bell
set cursorline                  " highlight the line under the cursor
set fillchars+=vert:│           " better looking for windows separator
set ttyfast                     " better screen redraw
set title                       " set the terminal title to the current file
set showcmd                     " shows partial commands
set hidden                      " hide the inactive buffers
set ruler                       " sets a permanent rule
set lazyredraw                  " only redraws if it is needed
set autoread                    " update a open file edited outside of Vim
set ttimeoutlen=0               " toggle between modes almost instantly
set backspace=indent,eol,start  " defines the backspace key behavior
set virtualedit=all             " to edit where there is no actual character
set scrolloff=7                 " buffer when scrolling

let mapleader=','
let maplocalleader=' '

let g:which_key_map_leader = {}
let g:which_key_map_leader.c = { 'name' : '+coding' }
let g:which_key_map_leader.e = { 'name' : '+enable-disable' }
let g:which_key_map_leader.h = { 'name' : '+search-history' }
let g:which_key_map_leader.r = { 'name' : '+repl-execute' }

" Never goback to compatible mode
nnoremap Q <nop>

" }}}

" Searching {{{

set incsearch                   " incremental searching
set showmatch                   " show pairs match
set hlsearch                    " highlight search results
set smartcase                   " smart case ignore
set ignorecase                  " ignore case letters

" }}}

" History and permanent undo levels {{{

set history=1000
set undofile
set undoreload=1000

" }}}

" Make a dir if no exists {{{

function! MakeDirIfNoExists(path)
    if !isdirectory(expand(a:path))
        call mkdir(expand(a:path), "p")
    endif
endfunction

" }}}

" Backups {{{

set backup
set noswapfile
set backupdir=$HOME/.vim/tmp/backup/
set undodir=$HOME/.vim/tmp/undo/
set directory=$HOME/.vim/tmp/swap/
" set viminfo+=n$HOME/.vim/tmp/viminfo

" make this dirs if no exists previously
silent! call MakeDirIfNoExists(&undodir)
silent! call MakeDirIfNoExists(&backupdir)
silent! call MakeDirIfNoExists(&directory)

" }}}

" Wildmenu {{{

set wildmenu                        " Command line autocompletion
set wildmode=list:longest,full      " Shows all the options

set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.bak,*.?~,*.??~,*.???~,*.~      " Backup files
set wildignore+=*.luac                           " Lua byte code
set wildignore+=*.jar                            " java archives
set wildignore+=*.pyc                            " Python byte code
set wildignore+=*.stats                          " Pylint stats

" }}}


" Tabs, space and wrapping {{{

set expandtab                  " spaces instead of tabs
set tabstop=4                  " a tab = four spaces
set shiftwidth=4               " number of spaces for auto-indent
set softtabstop=4              " a soft-tab of four spaces
set autoindent                 " set on the auto-indent

" set formatoptions=qrn1ct
set textwidth=0
" set colorcolumn=81

" function! ToggleWrap()
"     let s:nowrap_cc_bg = [22, '#005f00']
"     redir => s:curr_cc_hi
"     silent hi ColorColumn
"     redir END
"     " following two lines not working now ...
"     let s:curr_cc_ctermbg = matchstr(s:curr_cc_hi, 'ctermbg=\zs.\{-}\s\ze\1')
"     let s:curr_cc_guibg = matchstr(s:curr_cc_hi, 'guibg=\zs.\{-}\_$\ze\1')
"     if s:curr_cc_ctermbg != s:nowrap_cc_bg[0]
"         let g:curr_cc_ctermbg = s:curr_cc_ctermbg
"     endif
"     if s:curr_cc_guibg != s:nowrap_cc_bg[1]
"         let g:curr_cc_guibg = s:curr_cc_guibg
"     endif
"     if &textwidth == 80
"         set textwidth=0
"         exec 'hi ColorColumn ctermbg='.s:nowrap_cc_bg[0].
"                     \' guibg='.s:nowrap_cc_bg[1]
"     elseif &textwidth == 0
"         set textwidth=80
"         exec 'hi ColorColumn ctermbg='.g:curr_cc_ctermbg.
"                     \' guibg='.g:curr_cc_guibg
"     endif
" endfunction
" 
" nmap <silent><Leader>ew :call ToggleWrap()<CR>

" }}}

" Ok, a vim for men, get off the cursor keys {{{

" nnoremap <up> <nop>
" nnoremap <down> <nop>
" nnoremap <left> <nop>
" nnoremap <right> <nop>
" inoremap <up> <nop>
" inoremap <down> <nop>
" inoremap <left> <nop>
" inoremap <right> <nop>

" }}}


" Colorscheme {{{

color peachpuff

" }}}

" Resize the divisions if the Vim window size changes {{{

au VimResized * exe "normal! \<c-w>="

" }}}

" Fast window moves {{{

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
tnoremap <C-j> <C-w>j
tnoremap <C-k> <C-w>k

" }}}

" Emacs shortcut in normal mode {{{

" Binding <C-P> <C-N> to <M-P> < M-N>
inoremap p <C-P>
inoremap n <C-N>

" new key binding
inoremap p <Up>
inoremap n <Down>
inoremap <C-P> <Up>
inoremap <C-N> <Down>
imap <C-F> <Right>
imap <C-B> <Left>
inoremap f <S-Right>
inoremap b <S-Left>
imap <C-A> <ESC>I
imap <C-E> <ESC>A
imap d <ESC>lcw
imap <C-D> <Delete>

inoremap <C-x>2 <C-o><C-w>s
inoremap <C-x>3 <C-o><C-w>v
inoremap <C-x>0 <C-o><C-w>c
inoremap <C-x>1 <C-o><C-w>o
inoremap <C-x>o <C-o><C-w>w
inoremap <C-x>+ <C-o><C-w>=

" }}}
"
" tab page command {{{

" quick jump

command TC tabclose

" }}}

" change working directory
" set autochdir " due to ccls require relative folder
" See 'equalalways' in the Vim documentation
set noea
" map <C-w><C-w> to maximize current window vertically
noremap <C-w><C-w> <C-w>1000+

set number
set relativenumber

" This unsets the 'last search pattern' register by hitting ;
nnoremap ; :noh<CR>:<backspace>

" Toggle the Quickfix window {{{

function! s:QuickfixToggle()
    for i in range(1, winnr('$'))
        let bnum = winbufnr(i)
        if getbufvar(bnum, '&buftype') == 'quickfix'
            cclose
            lclose
            return
        endif
    endfor
    copen
endfunction
command! ToggleQuickfix call <SID>QuickfixToggle()

nnoremap <silent> <leader>eq :ToggleQuickfix<CR>
let g:which_key_map_leader.e.q = 'toggle quickfix'

" }}}

" Load matchit by default {{{

if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

" }}}

" folding setting {{{
" open all folds by default

set foldmethod=syntax
set foldlevelstart=99

" }}}

" Show hidden chars {{{

nmap <leader>eh :set list!<CR>
set listchars=tab:→\ ,eol:↵,trail:·,extends:↷,precedes:↶
let g:which_key_map_leader.e.h = 'hidden characters'

" }}}

