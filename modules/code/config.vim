"
" Author: Yiran Li <yiranli91@gmail.com>
" Source: https://github.com/siurius/vimrc
" 
" code: plugins for coding

scriptencoding utf-8

" coc.nvim begin
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `Alt-,` and `Alt-.` to navigate diagnostics
" nmap <silent> [g <Plug>(coc-diagnostic-prev)
" nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap , <Plug>(coc-diagnostic-prev)
nmap . <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>cf  <Plug>(coc-format-selected)
nmap <leader>cf  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
" Remap for do codeAction of current line
nmap <leader>al  <Plug>(coc-codeaction)
" " Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
" nmap <silent> <TAB> <Plug>(coc-range-select)
" xmap <silent> <TAB> <Plug>(coc-range-select)
" " Create mappings for function text object, requires document symbols feature of languageserver.
" xmap if <Plug>(coc-funcobj-i)
" xmap af <Plug>(coc-funcobj-a)
" omap if <Plug>(coc-funcobj-i)
" omap af <Plug>(coc-funcobj-a)

" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')
" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
" " Show commands
" nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" " Do default action for next item.
" nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" " Do default action for previous item.
" nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list

" coc-snippests
imap <C-l> <Plug>(coc-snippets-expand)

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
let g:coc_snippet_prev = '<s-tab>'

" Kite
let g:kite_auto_complete=1
set completeopt-=menu
set completeopt+=menuone   " Show the completions UI even with only 1 item
set completeopt-=longest   " Don't insert the longest common text
set completeopt+=preview   " Hide the documentation preview window
set completeopt+=noinsert  " Don't insert text automatically
set completeopt-=noselect  " Highlight the first completion automatically

" Codi
nnoremap <leader>rc :Codi!!<CR>
" Codi not working with stack ghci
" let g:codi#interpreters = {
"             \ 'haskell': {
"                 \ 'bin': ['stack', 'ghci'],
"                 \ 'prompt': '^λ. ',
"             \ },
"         \ }
let g:which_key_map_leader.r.c = 'codi'

" vim-slime
let g:slime_target = "vimterminal"
let g:slime_no_mappings = 1
xmap <c-c><c-c> <Plug>SlimeRegionSend
nmap <c-c><c-c> <Plug>SlimeParagraphSend
nmap <leader>rs <Plug>SlimeConfig
let g:slime_vimterminal_config = {"term_rows":"15"}
let g:which_key_map_leader.r.s = 'slime'


" removed
"
" " ALE
" let g:ale_linters = {
" \   'python': [],
" \   'haskell': ['stack ghc', 'stack hlint'],
" \}
" let g:ale_fixers = {
" \   'python': ['autopep8', 'yapf'],
" \}
" " auto format
" nnoremap <leader>cf :ALEFix<CR>
" let g:airline#extensions#ale#enabled = 1
" " change ALE sign let g:ale_sign_column_always = 1 let g:ale_set_highlights = 0
" let g:ale_sign_error = '✗'
" let g:ale_sign_warning = '⚡'
" nmap , <Plug>(ale_previous_wrap)
" nmap . <Plug>(ale_next_wrap)
" let g:ale_pattern_options = {
" \   '.*\.tex$': {'ale_enabled': 0},
" \}
" let g:which_key_map_leader.c.f = 'auto formatting'
" 
" " YouCompleteMe
" let g:ycm_server_keep_logfiles = 1
" let g:ycm_server_log_level = 'debug'
" let g:ycm_global_ycm_extra_conf = $VIMRC_DIR.'/ycm_extra_conf.py'
" let g:ycm_add_preview_to_completeopt = 1
" let g:ycm_seed_identifiers_with_syntax = 1
" " auto load ycm conf without confirm
" let g:ycm_confirm_extra_conf = 0
" " use tab instead of <C-P> and <C-N>
" inoremap <expr><tab>   pumvisible() ? "\<down>" : "\<tab>"
" inoremap <expr><s-tab> pumvisible() ? "\<up>" : "\<s-tab>"
" " YcmCompleter
" let g:ycm_key_detailed_diagnostics = '<leader>cd'
" nnoremap <leader>cg  :YcmCompleter GoToDefinitionElseDeclaration<CR>
" let g:ycm_autoclose_preview_window_after_completion=1
" " let g:ycm_filetype_specific_completion_to_disable = { 'python' : 1  }
" let g:ycm_filetype_blacklist = { 'python' : 1 }
" let g:which_key_map_leader.c.d = 'show detailed diagnostics'
" let g:which_key_map_leader.c.g = 'goto def. else dec.'
" 
" " YCM-Generator
" 
" " Eclim
" let g:EclimCompletionMethod = 'omnifunc'
" 
" " vim-hoogle
" function! HoogleToggle()
"     if (!exists("s:hoogle_switch")) || (s:hoogle_switch == 0)
"         let s:hoogle_switch = 1
"         execute "Hoogle"
"     else
"         let s:hoogle_switch = 0
"         execute "HoogleClose"
"     endif
" endfunction
" command -bar -nargs=0 HoogleToggle call HoogleToggle()
" nmap <F12> :HoogleToggle<CR>
" " use stack
" let g:hoogle_search_bin='stack hoogle'
" neco-ghc
" let g:ycm_semantic_triggers = {'haskell' : ['re!.']}
" let g:ycm_semantic_triggers = {'haskell' : ['.']}
" autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

