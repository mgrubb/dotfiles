" By default, the "end" keyword is colorized according to the opening statement
" of the block it closes.  While useful, this feature can be expensive; if you
" experience slow redrawing (or you are on a terminal with poor color support)
" you may want to turn it off by defining the "ruby_no_expensive" variable:
"let ruby_no_expensive = 1

" Ruby operators can be highlighted. This is enabled by defining ruby_operators:
let ruby_operators = 1

" Whitespace errors can be highlighted by defining "ruby_space_errors":
let ruby_space_errors = 1
" This will highlight trailing whitespace and tabs preceded by a space character
" as errors.  This can be refined by defining "ruby_no_trail_space_error" and
" "ruby_no_tab_space_error" which will ignore trailing whitespace and tabs after
" spaces respectively.

function! RunTests(filename)
    " Write the file and run tests for the given filename
    :w
    :silent !clear
    :silent exec ":!echo \"\e[0;34m$ rspec -p -b -fd " . substitute(a:filename, getcwd() . "/", "", "") . "\e[0m\""
    exec ":!time rspec -p -b -fd " . a:filename
endfunction

function! SetTestFile()
    " Set the spec file that tests will be run for.
    let t:grb_test_file=@%
endfunction

function! RunTestFile(...)
    if a:0
        let command_suffix = a:1
    else
        let command_suffix = ""
    endif

    " Run the tests for the previously-marked file.
    let in_spec_file = match(expand("%"), '_spec.rb$') != -1
    if in_spec_file
        call SetTestFile()
    elseif !exists("t:grb_test_file")
        return
    end
    call RunTests(t:grb_test_file . command_suffix)
endfunction

function! RunNearestTest()
    let spec_line_number = line('.')
    call RunTestFile(":" . spec_line_number)
endfunction

function! RunCucumberWip()
  :w
  :silent !clear
  :silent exec ":!echo \"\e[0;34m$ cucumber --profile wip\e[0m\""
  :!cucumber --profile wip
endfunction

function! RunCucumber(filename)
  :w
  :silent !clear
  :silent exec ":!echo \"\e[0;34m$ cucumber -r features " . substitute(a:filename, getcwd() . "/", "", "") . "\e[0m\""
  exec ":!cucumber -r features " . a:filename
endfunction

map <leader>t :call RunTestFile()<cr>
map <leader>T :call RunNearestTest()<cr>
map <leader>a :call RunTests('spec')<cr>
map <leader>c :call RunCucumber(@%)<cr>
map <leader>C :call RunCucumberWip()<cr>
