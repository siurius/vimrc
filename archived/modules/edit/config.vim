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

" Markdown Preview for (Neo)vim
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 1
" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0
" specify browser to open preview page
" default: ''
let g:mkdp_browser = 'firefox-private-window.sh'
" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
" disable_filename: if disable filename header for preview page, default: 0
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0
    \ }
" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''
" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''
" use a custom port to start server or random for empty
let g:mkdp_port = ''
" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'
" recognized filetypes
" these filetypes will have MarkdownPreview... commands
let g:mkdp_filetypes = ['markdown', 'md.asc']

" nmap <C-s> <Plug>MarkdownPreview
" nmap <M-s> <Plug>MarkdownPreviewStop
" nmap <C-p> <Plug>MarkdownPreviewToggle

" GPG
" Transparent editing of gpg encrypted files.
" By Wouter Hanegraaff
augroup encrypted
  au!

  " First make sure nothing is written to ~/.viminfo while editing
  " an encrypted file.
  autocmd BufReadPre,FileReadPre *.md.asc set viminfo=
  " We don't want a various options which write unencrypted data to disk
  autocmd BufReadPre,FileReadPre *.md.asc set noswapfile noundofile nobackup

  " Switch to binary mode to read the encrypted file
  autocmd BufReadPre,FileReadPre *.md.asc set bin
  autocmd BufReadPre,FileReadPre *.md.asc let ch_save = &ch|set ch=2
  " (If you use tcsh, you may need to alter this line.)
  autocmd BufReadPost,FileReadPost *.md.asc '[,']!gpg --decrypt 2> /dev/null

  " Switch to normal mode for editing
  autocmd BufReadPost,FileReadPost *.md.asc set nobin
  autocmd BufReadPost,FileReadPost *.md.asc let &ch = ch_save|unlet ch_save
  autocmd BufReadPost,FileReadPost *.md.asc execute ":doautocmd BufReadPost " . expand("%:r")

  " markdown syntax
  autocmd BufNewFile,BufRead *.md.asc set syntax=markdown

  " Convert all text to encrypted text before writing
  " get current recipient
  autocmd BufWritePre,FileWritePre *.md.asc let w:filename = expand("%")
  autocmd BufWritePre,FileWritePre *.md.asc let w:cmd = "'[,']!gpg " . system('get-recipient.sh ' . w:filename) . " -ae 2>/dev/null"
  " save cursor pos
  autocmd BufWritePre,FileWritePre *.md.asc let w:cursor_pos = getpos(".")
  " (If you use tcsh, you may need to alter this line.)
  autocmd BufWritePre,FileWritePre *.md.asc execute w:cmd
  " Undo the encryption so we are back in the normal text, directly
  " after the file has been written.
  autocmd BufWritePost,FileWritePost *.md.asc u
  " redraw window and recover cursor pos
  autocmd BufWritePost,FileWritePost *.md.asc redraw!
  autocmd BufWritePost,FileWritePost *.md.asc call cursor(w:cursor_pos[1], w:cursor_pos[2])
augroup END

