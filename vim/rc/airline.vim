" use fancy symbols
let g:Powerline_symbols = "fancy"
let g:airline#extensions#tabline#enabled = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" Fancy symbols
let g:airline_left_sep = "\u2b80"
let g:airline_left_alt_sep = "\u2b81"
let g:airline_right_sep = "\u2b82"
let g:airline_right_alt_sep = "\u2b83"
let g:airline_symbols.linenr = "\u2b61"
let g:airline_symbols.branch = "\u2b60"
let g:airline_symbols.readonly = "\u2b64"
let g:airline_theme = 'powerlineish'
