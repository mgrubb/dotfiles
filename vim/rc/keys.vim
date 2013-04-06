" Mapleader comma is what the cool kids use
let mapleader = ","

" Rename :W to :w
command! W :w

" Turn off F1
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Don't use Ex mode, use Q for formatting
map Q gq

" Make Ctrl-Y wordwise
inoremap <C-Y> <Esc>kl"zyiWj"zpa

" leave cursor at position of edit
map . .`[

noremap <F2> :NERDTreeToggle<CR>
noremap <F3> :GundoToggle<CR>

noremap <leader>d :call SearchDash()<CR>
