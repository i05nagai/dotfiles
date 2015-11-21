
let s:my_snippet = '~/.vim/snippets/'
let g:neosnippet#snippets_directory = s:my_snippet
" " Plugin key-mappings.
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
" For snippet_complete marker.
" texの数式も隠れるので
if has('conceal')
	"set conceallevel=2 concealcursor=i
endif

