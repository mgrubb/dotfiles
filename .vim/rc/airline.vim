" use fancy symbols
let g:Powerline_symbols = "fancy"
let g:airline#extensions#tabline#enabled = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" Fancy symbols
"let g:airline_left_sep = "\u2b80"
"let g:airline_left_sep = "\ue0c4"
let g:airline_left_sep = "\ue0c6"

"let g:airline_left_alt_sep = "\u2b81"
let g:airline_left_alt_sep = "\ue0c4"
"let g:airline_right_sep = "\u2b82"
let g:airline_right_sep = "\ue0c5"
"let g:airline_right_alt_sep = "\u2b83"
let g:airline_right_alt_sep = "\ue0c7"
"let g:airline_symbols.linenr = "\u2b61"
let g:airline_symbols.linenr = "\ue0a1"
"let g:airline_symbols.branch = "\u2b60"
let g:airline_symbols.branch = "\ue725"
"let g:airline_symbols.readonly = "\u0b64"
let g:airline_symbols.readonly = "\ue0a2"
"let g:airline_symbols.colnr = "\ue0a3"
let g:airline_theme = 'wombat'
let g:airline#extensions#branch#format = 2
