"
" Author: Yiran Li <yiranli91@gmail.com>
" Source: https://github.com/siurius/vimrc
" 
" code: plugins for coding

scriptencoding utf-8

" ALE
let g:ale_linters = {
\   'haskell': ['ghc', 'hlint'],
\}
let g:ale_fixers = {
\   'python': ['autopep8', 'yapf'],
\   'haskell': ['hfmt'],
\}
" auto format
nmap <leader>= :ALEFix<CR>
let g:airline#extensions#ale#enabled = 1
" change ALE sign let g:ale_sign_column_always = 1 let g:ale_set_highlights = 0
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
nmap k <Plug>(ale_previous_wrap)
nmap j <Plug>(ale_next_wrap)
let g:ale_pattern_options = {
\   '.*\.tex$': {'ale_enabled': 0},
\}

" YouCompleteMe
let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'
let g:ycm_global_ycm_extra_conf = $VIMRC_DIR.'/ycm_extra_conf.py'
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_seed_identifiers_with_syntax = 1
" auto load ycm conf without confirm
let g:ycm_confirm_extra_conf = 0
" use tab instead of <C-P> and <C-N>
inoremap <expr><tab>   pumvisible() ? "\<down>" : "\<tab>"
inoremap <expr><s-tab> pumvisible() ? "\<up>" : "\<s-tab>"
" YcmCompleter
nnoremap <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_autoclose_preview_window_after_completion=1
" let g:ycm_filetype_specific_completion_to_disable = { 'python' : 1  }
" let g:ycm_filetype_blacklist = { 'python' : 1  }

" Eclim
let g:EclimCompletionMethod = 'omnifunc'

" Codi
nnoremap <leader>c :Codi!!<CR>
let g:codi#interpreters = {
            \ 'haskell': {
            \ 'prompt': '^λ. ',
            \ },
            \ }

" neco-ghc
let g:ycm_semantic_triggers = {'haskell' : ['re!.']}
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

" vim-slime
let g:slime_target = "vimterminal"
nmap <leader>s :SlimeToggle<CR>
let g:slime_vimterminal_config = {"term_rows":"15"}

" vim-hoogle
function! HoogleToggle()
    if (!exists("s:hoogle_switch")) || (s:hoogle_switch == 0)
        let s:hoogle_switch = 1
        execute "Hoogle"
    else
        let s:hoogle_switch = 0
        execute "HoogleClose"
    endif
endfunction
command -bar -nargs=0 HoogleToggle call HoogleToggle()
nmap <F12> :HoogleToggle<CR>
