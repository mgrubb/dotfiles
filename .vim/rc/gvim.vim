" add to your own .gvimrc:
"
"   source ~/.vim/rc/gvim.vim
"
source ~/.vim/rc/all.vim
source ~/.vim/rc/tabularize.vim

colorscheme mg_symfony

" Antialias
set antialias

" Turn on only autoselect and console dialogs
" No menubar, toolbar or scrollbars, as minimal as possible
set guioptions=cg

" Hide mouse when typing
set mousehide

"set guifont=AnonymousProForPowerline:h16
"set guifont=Anonymice\ Powerline\ Nerd\ Font\ Plus\ Font\ Awesome\ Mono:h16
set guifont=monofur\ for\ Powerline\ Nerd\ Font\ Complete\ Mono:h17

" I like a little more linespace with this font
set linespace=1

" Turn off beep
set vb t_vb=

if has("gui_macvim")
  " fullscreen options (MacVim only), resized window when changed to fullscreen
  "
  " If you are on OSX Lion, and you hate Lion's native full screen, turn it off for macvim:
  "
  "   defaults write org.vim.MacVim MMNativeFullScreen 0
  "
  " Press Ctrl+Cmd+F to go full screen.
  set fuoptions=maxvert,maxhorz

  " Available when using experimental renderer in macvim
  " set transparency=15

  "set default screen size
  set lines=45 columns=120
end
