" Setup Plugins with VimPlug
call plug#begin('~/.local/share/nvim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-rails'
Plug 'dart-lang/dart-vim-plugin', { 'for': 'dart' }
Plug 'natebosch/vim-lsc'
Plug 'tpope/vim-surround'
Plug 'terryma/vim-multiple-cursors'
Plug 'mattn/emmet-vim', {'for': ['html', 'vue', 'css']}
Plug 'fatih/vim-go', {'for': 'go', 'do': ':GoInstallBinaries'}
Plug 'AndrewRadev/splitjoin.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'posva/vim-vue'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-abolish'
Plug 'vim-scripts/paredit.vim'
Plug 'luochen1990/rainbow'
Plug 'leafgarland/typescript-vim'
Plug 'vale1410/vim-minizinc'
Plug 'pangloss/vim-javascript'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
" Color schemes
Plug 'rakr/vim-one'
Plug 'wesgibbs/vim-irblack'
Plug 'ayu-theme/ayu-vim'
Plug 'baines/vim-colorscheme-thaumaturge'
Plug 'dim13/smyck.vim'
Plug 'crater2150/vim-theme-chroma'
Plug 'srcery-colors/srcery-vim'
call plug#end()

" Theme settings
set background=dark
colorscheme one
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors
let g:airline_theme = 'one'

if !has('nvim')
  set guifont=FiraCodeiScript-Regular:h14
endif

" Set Editing preferences
set shiftwidth=2
set tabstop=2
set expandtab
set autoindent
set smarttab
set nowrap


let g:lsc_server_commands = {'dart': '~/.pub-cache/bin/dart_language_server'}
let s:vim_config_file = "~/.config/nvim/init.vim"
command! EditConfig :vsplit $MYVIMRC
command! Reconfig :source $MYVIMRC
autocmd BufWritePost $MYVIMRC :source $MYVIMRC

" Change the Leader key
let mapleader = ","

" Enable python
let g:python_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'
"
" Keybindings
nnoremap <F1> <Esc>
nnoremap <silent> <F2> :NERDTreeToggle<CR>
nnoremap <silent> <F9> :syntax sync fromstart<CR>
nnoremap <silent> <leader>n :cnext<CR>
nnoremap <silent> <leader>p :cprevious<CR>
nnoremap <silent> <Enter> :nohlsearch<CR>
nnoremap <silent> <Right> :tabnext<CR>
nnoremap <silent> <Left> :tabprevious<CR>

" Plugin Specific settings
let g:NERDTreeIgnore=['node_modules', 'vendor']
let g:rainbow_active = 1

" ctrlp
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn|hg))$'

" vim-go
" run :GoBuild or :GoTestCompile based on go file
function! s:build_go_files()
    let l:file = expand('%')
    if l:file =~# '^\f\+_test\.go$'
        call go#test#Test(0, 1)
    elseif l:file =~# '^\f\+\.go$'
        call go#cmd#Build(0)
    endif
endfunction

" Turn off go version checking for now
let g:go_version_warning = 0
" Automatically handle imports
let g:go_fmt_command = "goimports"
" Enhanced coloring
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
" Show Type Info automatically
"let g:go_auto_type_info = 1

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>r <Plug>(go-run)
autocmd FileType go nmap <leader>t <Plug>(go-test)
autocmd FileType go nmap <leader>c <Plug>(go-coverage-toggle)
autocmd FileType go nmap <leader>i <Plug>(go-info)
autocmd FileType go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd FileType go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd FileType go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd FileType go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

" Make Fizz files hilight like go file
autocmd BufNewFile,BufRead *.fizz :set syntax=go
autocmd FileType go set autowrite

" Deoplete
let g:deoplete#enable_at_startup = 1

"NERD Commenter
let g:NERDSpaceDelims = 1
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhiteSpace = 1
