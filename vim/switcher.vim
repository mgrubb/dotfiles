if !has("gui_running")
	finish
endif

if !exists("g:terminal_program")
	finish
endif

if !exists("g:appswitch_path")
	if executable("/usr/local/bin/appswitch")
		let g:appswitch_path = "/usr/local/bin/appswitch"
	else
		finish
	endif
endif

function SwitchToTerm()
	
	if exists("b:fromterminal")
		call system(g:appswitch_path . " -f -a " . g:terminal_program)
	endif

endfunction

"autocmd VimLeave,BufLeave,GUIEnter * call SwitchToTerm()
