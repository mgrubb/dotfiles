" Should markdown preview get shown automatically
let g:livedown_autorun = 1

" should the browser window popup on preview
let g:livedown_open = 1

" the port on which Livedown server will run
let g:livedown_port = 7768

augroup livedown
  autocmd filetype markdown map gm :call LivedownPreview()<CR>
augroup END
