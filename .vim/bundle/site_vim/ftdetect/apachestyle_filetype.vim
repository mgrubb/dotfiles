"=============================================================================
" File:       apachestyle_filetype.vim
" Maintainer: Michael Grubb <devel@dailyvoid.com>
" License:    <+ LICENSE +>
" Created:    2011-02-25 16:48:15 CST
" GetLatestVimScripts: <+ ID +> 1 :AutoInstall: apachestyle_filetype.vim
"-----------------------------------------------------------------------------
" Avoid reinclusion
if exists("g:loaded_apachestyle_filetype")
    finish
endif
let g:loaded_apachestyle_filetype = 1

au BufNewFile,BufRead *.audit setfiletype apachestyle

