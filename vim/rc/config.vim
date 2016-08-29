let g:project_lib_prefix = 'lib'
let g:rails_level = 3
let g:tskelTitle = "Test Title"
let g:tskelNewBufferIsDirty = 0

" Configure syntax options
let perl_fold = 1
let perl_nofold_packages = 1
let g:is_kornshell = 1

" Configure Tasklist
let g:tlWindowPosition = 1
let g:cvWindowPosition = 1

" Default modeline for template expansion
let g:defmodeline = "sw=2:ts=2:sts=2:et:ai"

let g:syntastic_c_checkers = ['make', 'sparse', 'ycm']

" Ack prog
"let g:ackprg = 'ag --nogroup --nocolor --column'

" Disable folding unless I want it
set nofoldenable

let NERDTreeIgnore=['^Icon\r$']

"Only show tabline when needed
set showtabline=1
