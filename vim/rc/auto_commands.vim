" Set options for LyX files
autocmd BufRead *.lyx set syntax=lyx foldmethod=syntax foldcolumn=3
autocmd BufRead *.lyx syntax sync fromstart

autocmd filetype lisp,scheme,art setlocal equalprg=~/bin/lispindent.lisp
autocmd filetype lisp,scheme,art inoremap ( ()i
autocmd filetype lisp,scheme,art inoremap ) la

" Set buffer modeline setting for templates
autocmd BufRead,BufNewFile * let b:defmodeline=g:defmodeline

" Update the test plan for perl unit tests
autocmd BufWritePre **/tests/*.t :Renumber

" Remove fugitive buffers when they get hidden
autocmd BufReadPost fugitive://* set bufhidden=delete

augroup filetypedetect
  autocmd BufRead,BufNewFile Pakefile setf Pakefile
  autocmd BufRead,BufNewFile *.wiki nmap <Leader>d a= <C-R>=strftime("%a %e %b %Y")<CR> =<Esc>
augroup END

