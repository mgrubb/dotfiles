if !exists("g:autocommands_loaded")
let g:autocommands_loaded = 1

" Set buffer vars for template expansion
augroup template_commands
  autocmd BufRead,BufNewFile * let b:defmodeline=g:defmodeline
  autocmd BufRead,BufNewFile * let b:atwork=InWorkSrcDir(expand('%:p'))
augroup END

" Set options for LyX files
augroup ft_lyx
  autocmd BufRead *.lyx set syntax=lyx foldmethod=syntax foldcolumn=3
  autocmd BufRead *.lyx syntax sync fromstart
augroup END

augroup ft_clj
  autocmd filetype clojure let g:clojure_special_indent_words.=',describe'
  autocmd filetype clojure let g:clojure_fuzzy_indent_patterns+= ['^describe$', 'let$', 'facts', 'fact', 'tabular']
augroup END

augroup ft_lisp
"  autocmd filetype lisp,scheme,art setlocal equalprg=~/bin/lispindent.lisp
  autocmd filetype lisp,scheme,art inoremap ( ()i
  autocmd filetype lisp,scheme,art inoremap ) la
augroup END


" Update the test plan for perl unit tests
augroup perl_tests
  autocmd BufWritePre **/tests/*.t :Renumber
augroup END

" Remove fugitive buffers when they get hidden
augroup ft_fugitive
  autocmd BufReadPost fugitive://* set bufhidden=delete
augroup END

" Set foldmethod to marker for vimscript files
augroup ft_vim
  autocmd FileType vim setlocal foldmethod=marker
augroup END

" Make sure noexpandtab is set for pyton even though I HATE python
augroup ft_python
  autocmd FileType python setlocal noexpandtab
augroup END

" Misc filetype hooks ----------------------------------------------------{{{
augroup ft_misc
  autocmd BufRead,BufNewFile Pakefile setf Pakefile
  autocmd BufRead,BufNewFile *.wiki nmap <Leader>d a= <C-R>=strftime("%a %e %b %Y")<CR> =<Esc>
augroup END
" }}}
endif
