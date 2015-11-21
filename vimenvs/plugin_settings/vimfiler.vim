
"Prefix
nnoremap [VIMFILER]  <Nop>
nmap <Space>f [VIMFILER]

let g:vimfiler_as_default_explorer = 1
let g:vimfiler_enable_auto_cd = 1

"custom commands
let g:vimfiler_edit_action = 'edit'
call vimfiler#custom#profile('default', 'context', {
			\ 'edit_action' : 'tabopen',
\ })

"現在開いているバッファのディレクトリを開く
nnoremap <silent> [VIMFILER]e :<C-u>VimFilerBufferDir -quit<CR>
""現在開いているバッファをIDE風に開く
nnoremap <silent> [VIMFILER]i :<C-u>VimFilerBufferDir -split -simple -winwidth=35 -no-quit<CR>

"data_directory
if has('win32')
	"let g:vimfiler_data_directory = 'C:\.vimfiler'
elseif has('macunix')
	let g:vimfiler_data_directory = '~/.vim/.vimfiler'
else
	let g:vimfiler_data_directory = '~/.vimfiler'
endif


"change default key mappings
augroup vimrc
	autocmd FileType vimfiler call s:vimfiler_my_settings()
augroup END
function! s:vimfiler_my_settings()
	nmap <buffer> q <Plug>(vimfiler_exit)
	nmap <buffer> Q <Plug>(vimfiler_hide)
endfunction

