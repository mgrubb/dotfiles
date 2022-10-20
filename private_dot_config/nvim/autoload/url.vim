" https://stackoverflow.com/questions/9458294/open-url-under-cursor-in-vim-with-browser/9459366#9459366
function! url#Open()
  let s:uri = matchstr(getline("."), '[a-z]*:\/\/[^ >,;]*')
  echo s:uri
  if s:uri != ""
    silent exec "!open '".s:uri."'"
  else
    echo "No URI found in line."
  endif
endfunction
