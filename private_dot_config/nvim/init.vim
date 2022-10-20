" Disable ALE LSP
let g:ale_disable_lsp = 1

" Setup Plugins with VimPlug
call plug#begin('~/.local/share/nvim/plugged')
command! -nargs=+ -bar CocPlug call plug#(<args>, {'do': 'yarn install --frozen-lockfile'})
"Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'airblade/vim-rooter' " Changes working directory to project root
Plug 'cespare/vim-toml'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
"Plug 'tpope/vim-rails'
Plug 'dart-lang/dart-vim-plugin', { 'for': 'dart' }
Plug 'davidhalter/jedi-vim', { 'for': 'python' }
Plug 'lambdalisue/vim-pyenv', { 'for': 'python' }
" Plug 'natebosch/vim-lsc'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fireplace'
Plug 'terryma/vim-multiple-cursors'
Plug 'mattn/emmet-vim', {'for': ['html', 'vue', 'css']}
Plug 'fatih/vim-go', {'for': 'go', 'do': ':GoUpdateBinaries'}
Plug 'wlangstroth/vim-racket', {'for': ['rkt', 'rktl']}
"Plug 'AndrewRadev/splitjoin.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
"Plug 'ctrlpvim/ctrlp.vim'
"Plug 'posva/vim-vue'
Plug 'andymass/vim-matchup' " enhance % to match language specific pairs
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-abolish'
Plug 'vim-scripts/paredit.vim'
Plug 'luochen1990/rainbow'
"Plug 'leafgarland/typescript-vim'
"Plug 'vale1410/vim-minizinc'
"Plug 'pangloss/vim-javascript'
Plug 'bfrg/vim-jq'
Plug 'bfrg/vim-jqplay'
Plug 'tpope/vim-repeat'
Plug 'dense-analysis/ale' " Better syntax/linter
"Plug 'fukamachi/vlime', {'rtp': 'vim/'}
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Code completion engine
Plug 'jvirtanen/vim-hcl'

" Language Servers
CocPlug 'fannheyward/coc-texlab'
CocPlug 'neoclide/coc-pairs'
CocPlug 'neoclide/coc-json'
CocPlug 'neoclide/coc-yaml'
CocPlug 'neoclide/coc-html'
CocPlug 'fannheyward/coc-rust-analyzer'
CocPlug 'josa42/coc-go'
CocPlug 'neoclide/coc-vetur'
CocPlug 'pappasam/coc-jedi'
CocPlug 'iamcco/coc-flutter'
Plug 'neoclide/coc-sources',  {'rtp': 'packages/ultisnips'}

" Color schemes
Plug 'rakr/vim-one'
"Plug 'wesgibbs/vim-irblack'
"Plug 'ayu-theme/ayu-vim'
Plug 'chriskempson/base16-vim'
Plug 'mgrubb/vim-colorscheme-thaumaturge'
"Plug 'dim13/smyck.vim'
"Plug 'crater2150/vim-theme-chroma'
"Plug 'srcery-colors/srcery-vim'
Plug 'vim-scripts/Relaxed-Green'
call plug#end()

" Set Editing preferences
set splitright
set splitbelow
set shiftwidth=2
set tabstop=2
set expandtab
set autoindent
set smarttab
set nowrap


let g:jedi#completions_enabled = 0
let g:jedi#popup_on_dot = 0

" let g:lsc_server_commands = {'dart': '~/.pub-cache/bin/dart_language_server'}
let s:vim_config_file = "~/.config/nvim/init.vim"

runtime chezmoi.vim
execute 'command! EditConfig :vsplit '.g:chezmoi_source.'/private_dot_config/nvim/init.vim'
command! Reconfig execute 'silent !chezmoi apply ~/.config/nvim' | execute 'source ' . expand('~/.config/nvim/init.vim')
execute 'autocmd BufWritePost '.g:chezmoi_source.'/private_dot_config/nvim/* execute "silent !chezmoi apply ~/.config/nvim"'

autocmd FileType racket abbrev `l λ
autocmd FileType racket let b:coc_pairs_disabled = ["`", "'"]

" Change the Leader key
let mapleader = ","


" Dart Format
autocmd FileType dart nnoremap <silent> cf execute '%!dart format'

" Enable python
let g:loaded_python_provider = 0
"let g:python_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/Users/mgrubb/.pyenv/shims/python'
let g:ruby_host_prog = '/Users/mgrubb/.rbenv/shims/neovim-ruby-host'
autocmd BufNewFile,BufRead *.py set
  \ tabstop=4
  \ softtabstop=4
  \ shiftwidth=4
  \ expandtab
  \ autoindent
  \ fileformat=unix

" Keybindings -- See CoC below for more
map <F1> <Esc>
imap <F1> <Esc>
nnoremap <silent> <F2> :NERDTreeToggle<CR>
nnoremap <silent> <F9> :syntax sync fromstart<CR>
nnoremap <silent> <leader>n :cnext<CR>
nnoremap <silent> <leader>p :cprevious<CR>
nnoremap <silent> <Leader><Enter> :nohlsearch<CR>
nnoremap <silent> <Right> :tabnext<CR>
nnoremap <silent> <Left> :tabprevious<CR>
" add blank line below current line but stay here
nnoremap <silent> <Leader>o o<Esc>k
" add blank line above current line but stay here
nnoremap <silent> <Leader>O O<Esc>j
" Shows/hides hidden characters
nnoremap <silent> <leader><space> :set invlist<cr>
" Replace up to next char
nnoremap <leader>m ct
" Use // to search for selected text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

nnoremap <leader>u :call url#Open()<CR>

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

function! s:setupMarkup()
  nnoremap <Leader>p :silent !open -a Markoff.app '%:p'<cr>
endfunction

" let g:go_debug = ['shell-commands', 'lsp']

" Turn off go version checking for now
let g:go_version_warning = 0
" Automatically handle imports
let g:go_fmt_command = "gopls"
let g:go_gopls_gofumpt=1
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
let g:go_auto_type_info = 1

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>r <Plug>(go-run)
autocmd FileType go nmap <leader>t <Plug>(go-test)
autocmd FileType go nmap <leader>c <Plug>(go-coverage-toggle)
autocmd FileType go nmap <leader>i <Plug>(go-info)
autocmd FileType go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd FileType go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd FileType go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd FileType go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
" See ~/.config/nvim/ftplugin/go.vim for more
autocmd BufNewFile,BufRead *.{md,markdown,mdown,mkd,mkdn} call s:setupMarkup()

" Make Fizz files hilight like go file
autocmd BufNewFile,BufRead *.fizz :set syntax=go
autocmd FileType go set autowrite

" CoC
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction

" Use <c-.> to trigger completion
inoremap <silent><expr> <C-.> coc#refresh()

" Use <CR> to confirm completion, `<C-g>u` means break undo chain at current
" position. CoC only does snippet and additional edit on confirm.
if exists('*complete_info')
  inoremap <expr> <CR> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif


" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnositc-prev)
nmap <silent> ]g <Plug>(coc-diagnositc-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show docs in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim', 'help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Function text object
" NOTE: requires 'textDocument.documentSymbol' support from the language
" server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ic <Plug>(coc-classobj-i)
omap ac <Plug>(coc-classobj-a)

" Use <TAB> for selections ranges.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Find symbol of current document.
nnoremap <silent> <space>o :<C-u>CocList outline<CR>

" Search workspace symbols.
nnoremap <silent> <space>s :<C-u>CocList -I symbols<CR>

" Show actions available at this location
nnoremap <silent> <space>a :CocAction<CR>

"NERD Commenter
let g:NERDSpaceDelims = 1
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhiteSpace = 1

"Syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_wq = 1

" let g:syntastic_ruby_checkers = ['rubocop']
" let g:syntastic_ruby_rubocop_exec = '/usr/local/bin/cookstyle'
" let g:syntastic_mode_map = {
  " \ "passive_filetypes": ["html", "jinja.html"]}

" autocmd BufNewFile,BufRead Vagrantfile :SyntasticToggleMode

" Syntax Tweaks
let g:is_bash = 1

" Theme settings
set background=dark
"colorscheme thaumaturge
colorscheme base16-outrun-dark

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors
let g:airline_theme = 'one'

if !has('nvim')
  set guifont=FiraCodeiScript-Regular:h14
endif

" Vim-Rooter
let g:rooter_change_directory_for_non_project_files = 'current'

" UltiSnips settings
let g:UltiSnipsListSnippets="<c-l>"
let g:UltiSnipsExpandTrigger="<nop>"

" vim: ft=vim