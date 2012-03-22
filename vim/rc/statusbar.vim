" Add Git status info to statusline
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" Show the current command in the lower right corner
set showcmd

" Show the current mode
set showmode

" Always show the ruler
set ruler

" Always show the statusbar
set laststatus=2

function! WhenInsertMode()
  hi StatusLine ctermfg=235 ctermbg=203 cterm=reverse term=reverse
endfunction

function! NotInsertMode()
  hi StatusLine ctermfg=235 ctermbg=117 cterm=reverse term=reverse
endfunction

" now set it up to change the status line based on mode
if version >= 700
  au InsertEnter * call WhenInsertMode()
  au InsertLeave * call NotInsertMode()
endif

hi ModeMsg ctermfg=203 ctermbg=White cterm=reverse term=reverse
hi StatusLine ctermfg=235 ctermbg=254 cterm=reverse term=reverse
hi StatusLineNC ctermfg=235 ctermbg=254 cterm=reverse term=reverse

call NotInsertMode()
