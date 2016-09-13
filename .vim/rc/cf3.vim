
fun! Getchar()
  let c = getchar()
  if c != 0
    let c = nr2char(c)
  endif
  return c
endfun

fun! Eatchar(pat)
   let c = Getchar()
   return (c =~ a:pat) ? '' : c
endfun

let EnableCFE3KeywordAbbreviations=1
autocmd BufRead,BufNewFile *.cf set ft=cf3
autocmd BufRead,BufNewFile *.cf normal zR
