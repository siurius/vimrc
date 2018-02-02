"
" Author: Yiran Li <yiranli91@gmail.com>
" Source: https://github.com/siurius/vimrc
" 
" Minimal usable git configuration

scriptencoding utf-8

set t_ut=
set nocompatible    " Do not compatible with old-fashioned vi

" TODO: adds auto update function

" always load basic.vim
let basic_module = $VIMRC_DIR . "/modules/basic.vim"
if filereadable(basic_module)
    exec ':so ' basic_module
endif

if len(g:vimrc_modules) > 0
    exec ':so ' $VIMRC_DIR."/autoload/plug.vim"

    call plug#begin($VIMRC_DIR . "/plugged")
    for module in g:vimrc_modules
        let module_path = $VIMRC_DIR . "/modules/" . module . "/plugin.vim"
        if filereadable(module_path)
            exec ':so ' module_path
        endif
    endfor
    call plug#end()


    for module in g:vimrc_modules
        let module_path = $VIMRC_DIR . "/modules/" . module . "/config.vim"
        if filereadable(module_path)
            exec ':so ' module_path
        endif
    endfor
endif

" indent and plugins by filetype. Need to turn it on after importing modules.
filetype plugin indent on      
syntax enable
" then change current line highlighter
" keeps syntax highlight while highlighting current line
hi clear CursorLine
hi CursorLine ctermbg=Black

