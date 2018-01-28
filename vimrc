"
"                       __   _(_)_ __ ___  _ __ ___
"                       \ \ / / | '_ ` _ \| '__/ __|
"                        \ V /| | | | | | | | | (__
"                       (_)_/ |_|_| |_| |_|_|  \___|
"
" Author: Yiran Li <yiranli91@gmail.com>
" Source: https://github.com/siurius/vimrc

set nocompatible    " Do not compatible with old-fashioned vi

" TODO: add auto update function

" Before everything starts, load {{{

let s:before_vimrc = expand($VIMRC_DIR."/before.vimrc")
if filereadable(s:before_vimrc)
    exec ':so ' . s:before_vimrc
endif

" }}}

" NEOBUNDLE {{{

" NeoBundle auto-installation and setup {{{

" Auto installing NeoBundle
let iCanHazNeoBundle=1
let neobundle_readme=expand($VIMRC_DIR."/bundle/neobundle.vim/README.md")
let neobundle_runtimepath=expand($VIMRC_DIR."/bundle/neobundle.vim/")
if !filereadable(neobundle_readme)
    echo "Installing NeoBundle.."
    echo ""
    execute "silent !mkdir -p ".$VIMRC_DIR."/bundle"
    execute "silent !git clone https://github.com/Shougo/neobundle.vim ".$VIMRC_DIR."/bundle/neobundle.vim"
    let iCanHazNeoBundle=0
endif

" Call NeoBundle
if has('vim_starting')
    let &rtp=neobundle_runtimepath.','.&rtp
endif

call neobundle#begin(expand($VIMRC_DIR.'/bundle/'))

" is better if NeoBundle rules NeoBundle (needed!)
NeoBundle 'Shougo/neobundle.vim'
" }}}

" BUNDLES (plugins administrated by NeoBundle) {{{

" Dark themes
" Improved terminal version of molokai, almost identical to the GUI one
NeoBundle 'joedicastro/vim-molokai256'
NeoBundle 'tomasr/molokai'

" A better looking status line
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'


call neobundle#end()
" END BUNDLES }}}

" <Leader> & <LocalLeader> mapping {{{

let mapleader=','
let maplocalleader= ' '

" }}}


" END NEOBUNDLE }}}

" IMPORT PACKAGES {{{

for package in g:vimrc_packages
    let package_path = $VIMRC_DIR . "/packages/" . package . ".vimrc"
    if filereadable(package_path)
        exec ':so ' package_path
    endif
endfor

" Indent and plugins by filetype. Need to turn it on after importing packages.
filetype plugin indent on      

" END IMPORT PACKAGES }}}


" Auto install the plugins {{{

" First-time plugins installation
if iCanHazNeoBundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    set nomore
    NeoBundleInstall
endif
set more

" Check if all of the plugins are already installed, in other case ask if we
" want to install them (useful to add plugins in the .vimrc)
NeoBundleCheck

" }}}

" PLUGINS Setup {{{

" Airline {{{

set noshowmode

let g:airline_theme='powerlineish'
let g:airline_powerline_fonts=1
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#hunks#non_zero_only = 1

" let g:airline#extensions#tabline#enabled = 2
" let g:airline#extensions#tabline#fnamemod = ':t'
" let g:airline#extensions#tabline#buffer_min_count = 1

" }}}

" Font {{{

set guifont=Droid\ Sans\ Mono\ for\ Powerline\ 11

" " }}}}


" END PLUGINS SETUP }}}


" After everything ends, load {{{

let s:after_vimrc = expand($VIMRC_DIR."/.after.vimrc")
if filereadable(s:after_vimrc)
    exec ':so ' . s:after_vimrc
endif

" }}}

