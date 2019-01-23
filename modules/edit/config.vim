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

" vim-markbar
" Note the use of map instead of noremap
nmap <leader>em <Plug>ToggleMarkbar
let g:which_key_map_leader.e.m = 'toggle markbar'
" only display alphabetic marks a-i and A-I
let g:markbar_marks_to_display = 'abcdefghiABCDEFGHI'
let g:markbar_width = 50
let g:markbar_num_lines_context = 3
let g:markbar_file_mark_format_string = '%d @ %s'
let g:markbar_file_mark_arguments = ['line', 'fname']
let g:markbar_enable_mark_highlighting = v:true
let g:markbar_explicitly_remap_mark_mappings = v:true

