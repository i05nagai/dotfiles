
autocmd FileType gitv call s:my_gitv_settings()

"get git hash
function! s:gitv_get_current_hash()
  return matchstr(getline('.'), '\[\zs.\{7\}\ze\]$')
endfunction

"gitv specific settings
function! s:my_gitv_settings()
	nnoremap [GITV]  <Nop>
	nmap <Space>g [GITV]

	setlocal iskeyword+=/,-,.
	nnoremap <silent><buffer>[GITV]C :<C-u>Git checkout <C-r><C-w><CR>

	nnoremap <buffer> [GITV]rb :<C-u>Git rebase <C-r>=GitvGetCurrentHash()<CR><Space>
	nnoremap <buffer> [GITV]R :<C-u>Git revert <C-r>=GitvGetCurrentHash()<CR><CR>
	nnoremap <buffer> [GITV]h :<C-u>Git cherry-pick <C-r>=GitvGetCurrentHash()<CR><CR>
	nnoremap <buffer> [GITV]rh :<C-u>Git reset --hard <C-r>=GitvGetCurrentHash()<CR>
endfunction

