" Set options for LyX files
augroup ft_lyx
  autocmd!
  autocmd BufRead *.lyx set syntax=lyx foldmethod=syntax foldcolumn=3
  autocmd BufRead *.lyx syntax sync fromstart
augroup END

augroup ft_lisp
  autocmd!
  autocmd filetype lisp,scheme,art setlocal equalprg=~/bin/lispindent.lisp
  autocmd filetype lisp,scheme,art inoremap ( ()i
  autocmd filetype lisp,scheme,art inoremap ) la
augroup END

" Set buffer modeline setting for templates
augroup template_commands
  autocmd!
  autocmd BufRead,BufNewFile * let b:defmodeline=g:defmodeline
augroup END

" Update the test plan for perl unit tests
augroup perl_tests
  autocmd!
  autocmd BufWritePre **/tests/*.t :Renumber
augroup END

" Remove fugitive buffers when they get hidden
augroup ft_fugitive
  autocmd!
  autocmd BufReadPost fugitive://* set bufhidden=delete
augroup END

" Set foldmethod to marker for vimscript files
augroup ft_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END

" Make sure noexpandtab is set for pyton even though I HATE python
augroup ft_python
  autocmd!
  autocmd FileType python setlocal noexpandtab
augroup END

" Misc filetype hooks ----------------------------------------------------{{{
augroup ft_misc
  autocmd!
  autocmd BufRead,BufNewFile Pakefile setf Pakefile
  autocmd BufRead,BufNewFile *.wiki nmap <Leader>d a= <C-R>=strftime("%a %e %b %Y")<CR> =<Esc>
augroup END
" }}}
