" VimWiki config
let g:vimwiki_hl_cb_checked = 1
let g:vimwiki_listsyms = ' ---X'
let g:vimwiki_wiki_defopts = {
    \'auto_export': 1,
    \'index': 'main',
    \'html_header': $HOME."/Sites/vwiki/vwiki_header.tpl",
    \'html_footer': $HOME."/Sites/vwiki/vwiki_footer.tpl",
    \'gohome': 'tabe',
    \'nested_syntaxes': { 'c': 'c', 'shell': 'shell', 'clojure': 'clojure', 'perl': 'perl', },
\}

let g:vimwiki_list = [
    \extend({'path': $HOME."/Documents/Notes/",
    \'path_html': $HOME."/Sites/vwiki/" }, g:vimwiki_wiki_defopts)]

unlet g:vimwiki_wiki_defopts

"function! VimwikiWeblinkHandler(weblink)
"	let browser = 'Firefox'
"	exe '!open -a "'.browser.'" '. a:weblink
"endfunction

" vim:tw=79:sw=4:ts=4:ai:
