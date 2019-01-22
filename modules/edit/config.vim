"
" Author: Yiran Li <yiranli91@gmail.com>
" Source: https://github.com/siurius/vimrc
" 
" edit: Edit enhancements

scriptencoding utf-8

" vim-easymotion
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
let g:EasyMotion_do_mapping=0

" multiple cursors
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-m>'
let g:multi_cursor_prev_key='<C-[>'
let g:multi_cursor_skip_key='<C-]>'
let g:multi_cursor_quit_key='<Esc>'
