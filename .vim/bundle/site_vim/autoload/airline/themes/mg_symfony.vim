let g:airline#themes#mg_symfony#palette = {}

let s:N1 = [ '#ffffff', '#222222', 15, 235 ]
let s:N2 = [ Green, '#222222', 46, 235, gui=bold ]
let s:N3 = [ '#6d9cbe', '#222222', 67, 235 ]
let g:airline#themes#mg_symfony#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)

let g:airline#themes#mg_symfony#palette.normal_modified = {
  \ 'airline_c': [ '#ffffff', '#5f005f', 255, 53, '' ],
  \ }
