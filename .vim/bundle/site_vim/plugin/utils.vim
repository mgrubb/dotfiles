"=============================================================================
" File:       utils.vim
" Maintainer: Michael Grubb <mtg@dailyvoid.com>
" License:    <+ LICENSE +>
" Created:    2011-01-25 15:45:38 CST
" GetLatestVimScripts: <+ ID +> 1 :AutoInstall: utils.vim
"-----------------------------------------------------------------------------
" Description:
"   <+ DESCRIPTION +>
"
" Usage:
"   <+ USAGE +>
"
" Notes:
"   <+ NOTES +>
"-----------------------------------------------------------------------------
" Installation:
"   <+ INSTALLATION +>
"
" History:
"   <+ HISTORY +>
"
" TODO:
"   <+ TODO +>
"=============================================================================

" Avoid reinclusion
if exists("g:loaded_utils")
    finish
endif
let g:loaded_utils = 1

function! Renumber()
"	let l:save_cursor = getpos('.')
	let l:save_view = winsaveview()
	silent! execute "%s/#test .*$/#test @@/g"
	silent! execute "%Inc p@@ s1"
	silent! execute "1,10s/^\\(use Test::More tests =>\\).*$/\\1 " . IncLastVal() . ";/"
"	call setpos('.', l:save_cursor)
	call winrestview(l:save_view)
endfunction
command! Renumber call Renumber()

function! s:is_in_git()
	call system("git rev-parse 2>/dev/null")
	if ( v:shell_error == 128 )
		return 0
	else
		return 1
	endif
endfunction

function! s:run_git(cmd,...)
	if ( a:0 < 1 )
		if ( !s:is_in_git() )
			return ""
		endif
	endif

	let output = system("git " . a:cmd . " 2>/dev/null")
	if ( v:shell_error == 128 )
		return ""
	else
		return substitute(output, "\n", "", "g")
	endif
endfunction

function! s:git_config(citem)
	return s:run_git("config " . a:citem, 1)
endfunction

function! TSkeleton_GIT_USER()
	return s:git_config("user.name")
endfunction

function! TSkeleton_GIT_EMAIL()
	return s:git_config("user.email")
endfunction

function! s:git_file_path()
	let projroot = s:run_git("rev-parse --show-toplevel",1)
	return tskeleton#EvalInDestBuffer('substitute(expand("%:p"), "' . projroot . '/", "", "")')
endfunction

function! TSkeleton_FILE_PATH()
	if ( s:is_in_git() )
		return s:git_file_path()
	endif

	return tskeleton#EvalInDestBuffer('substitute(expand("%:p"), "^" . $HOME . "/", "", "")')
endfunction

"Redefine the NOTE tag
function! TSkeleton_NOTE()
	return tskeleton#GetVar("tskelTitle", 'input("Please describe the file: ")', '')
endfunction

function! s:make_perl_package_from_path(filename, libdir)
	let pkg_paths = tlib#file#Split(a:filename)
	let libpos = index(pkg_paths, a:libdir) + 1
	return join(pkg_paths[libpos : ], "::")
endfunction

function! s:make_jvm_package_from_path(filename, libdir)
    let pkg_paths = tlib#file#Split(a:filename)
    let libpos = index(pkg_paths, a:libdir) + 1
    return join(pkg_paths[libpos : ], ".")
endfunction

function! TSkeleton_JVM_PKG()
    let prefix = tskeleton#GetVar('project_lib_prefix')
    return s:make_jvm_package_from_path(tskeleton#EvalInDestBuffer('expand("%:p:r")'), prefix)
endfunction

function! TSkeleton_PERL_PKG()
	let prefix = tskeleton#GetVar('project_lib_prefix')
	return s:make_perl_package_from_path(tskeleton#EvalInDestBuffer('expand("%:p:r")'), prefix)
endfunction

function! TSkeleton_TIMESTAMP()
	return strftime("%Y-%m-%d %H:%M")
endfunction

function! TSkeleton_ATWORK()
    if ( InWorkSrcDir(tskeleton#EvalInDestBuffer('expand("%:p")')) )
        return "ATWORK"
    else
        return ""
    endif
endfunction

function! WorkSrcDir()
    let wsd = resolve(expand('~/.worksrc'))
    if ( isdirectory(wsd) )
        return wsd
    elseif ( filereadable(wsd) )
        let dir = readfile(wsd)[0]
        if ( strlen(dir) != 0 && isdirectory(dir) )
            return resolve(dir)
        endif
    else
        echoerr "Unable to determine work source directory."
        return ""
    endif
endfunction

function! InWorkSrcDir(dir)
    let wsd = WorkSrcDir() . '/'
    if ( matchend(resolve(a:dir), wsd) < 0 )
        return 0
    else
        return 1
    endif
endfunction

" vim:tw=79:sw=4:ts=4:ai:
