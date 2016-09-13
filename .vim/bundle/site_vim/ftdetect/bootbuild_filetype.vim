if exists("g:loaded_bootbuild_filetype")
  finish
endif
let g:loaded_bootbuild_filetype = 1
augroup bootbuildft
  au BufNewFile,BufRead build.boot setfiletype clojure
augroup END
