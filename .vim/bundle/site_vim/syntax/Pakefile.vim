if version < 600
	syntax clear
elseif exists("b:current_syntax")
	finish
endif

" Source perl syntax file
ru! syntax/perl.vim

"Set the filetype to perl
set ft=perl

syn keyword perlStatement desc task rule file directory multi_task pake_dependency default
