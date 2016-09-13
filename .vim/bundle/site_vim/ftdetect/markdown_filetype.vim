if exists("g:loaded_markdown_filetype")
  finish
endif
let g:loaded_markdown_filetype = 1
augroup markdownft
  au BufNewFile,BufRead *.md,*.mkd,*.markdown,*.mkdn,*.mdown setfiletype markdown
augroup END
