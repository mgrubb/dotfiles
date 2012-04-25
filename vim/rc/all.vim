" add to your own .vimrc:
"
"   source ~/.vim/rc/all.vim
"
set nocompatible
call pathogen#infect()
call pathogen#helptags()
syntax on
filetype plugin indent on

source ~/.vim/rc/config.vim
source ~/.vim/rc/arrow_keys.vim
source ~/.vim/rc/splits.vim
source ~/.vim/rc/history.vim
source ~/.vim/rc/statusbar.vim
source ~/.vim/rc/command-t.vim
source ~/.vim/rc/ruby.vim
source ~/.vim/rc/clojure.vim
source ~/.vim/rc/search.vim
source ~/.vim/rc/indent.vim
source ~/.vim/rc/visual.vim
source ~/.vim/rc/keys.vim
source ~/.vim/rc/vimwikirc.vim