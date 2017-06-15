
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
if neobundle#is_installed('neocomplete')
	" Use neocomplete.
	let g:neocomplete#enable_at_startup = 1
	" Use smartcase.
	let g:neocomplete#enable_smart_case = 1
	" Set minimum syntax keyword length.
	let g:neocomplete#sources#syntax#min_keyword_length = 3
	let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

	" Define dictionary.
	let g:neocomplete#sources#dictionary#dictionaries = {
		\ 'default' : '',
		\ }

	" Define keyword.
	if !exists('g:neocomplete#keyword_patterns')
		let g:neocomplete#keyword_patterns = {}
	endif
	let g:neocomplete#keyword_patterns['default'] = '\h\w*'

	" Plugin key-mappings.
	inoremap <expr><C-g>     neocomplete#undo_completion()
	inoremap <expr><C-l>     neocomplete#complete_common_string()

	" Recommended key-mappings.
	" <CR>: close popup and save indent.
	inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
	function! s:my_cr_function()
	  return neocomplete#close_popup() . "\<CR>"
	  " For no inserting <CR> key.
	  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
	endfunction
	" <TAB>: completion.
	" <C-h>, <BS>: close popup and delete backword char.
	inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
	inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
	inoremap <expr><C-y>  neocomplete#close_popup()
	inoremap <expr><C-e>  neocomplete#cancel_popup()

elseif neobundle#is_installed('neocomplcache')
	" Disable AutoComplPop.
	let g:acp_enableAtStartup = 0
	let g:neocomplcashe_enable_at_startup=1
	let g:neocomplcache_auto_completion_start_length=2
	let g:neocomplcache_enable_smart_case = 1
	" シンタックスをキャッシュするときの最小文字長
	let g:neocomplcache_min_syntax_length = 3
	" Define dictionary.
	let g:neocomplcache_dictionary_filetype_lists = {
		\ 'default' : ''
		\ }
	" Plugin key-mappings.
	inoremap <expr><C-g> neocomplcache#undo_completion()
	" 補完候補のなかから、共通する部分を補完します。ちょうど、シェルの補完のような動作
	inoremap <expr><C-l> neocomplcache#complete_common_string()
	"改行で補完ウィンドウを閉じる
	inoremap <expr><CR> neocomplcache#smart_close_popup() . "\<CR>"
	" Define keyword.
	if !exists('g:neocomplcache_keyword_patterns')
		let g:neocomplcache_keyword_patterns = {}
	endif 
	let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
endif

"TABで保管候補の選択
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
" path to snippet
let g:neocomplcache_snippets_dir = '~/.vim/snippets/'
