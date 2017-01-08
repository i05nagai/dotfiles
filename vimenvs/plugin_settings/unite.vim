
"Prefix
nnoremap [UNITE]  <Nop>
nmap <Space>u [UNITE]

" start normal mode
let g:unite_enable_start_insert = 0
"buffer一覧を表示
nnoremap [UNITE]b :<C-u>Unite buffer<CR>
"Current Directoryを開く
nnoremap [UNITE]f :<C-u>UniteWithBufferDir file<CR>
"Most Recently used file
nnoremap [UNITE]m :<C-u>Unite file_mru<CR>
"画面分割してuniteを開く
nnoremap [UNITE]v :vsplit<CR>:<C-u>UniteWithBufferDir -buffer-name=files buffer bookmark file<CR>
"レジスタ一覧
nnoremap <silent> [UNITE]r :<C-u>Unite -buffer-name=register register<CR>
"タブ一覧
nnoremap [UNITE]t :<C-u>Unite tab<CR>
"neosnippet/user
nnoremap [UNITE]su :<C-u>Unite neosnippet/user<CR>
nnoremap [UNITE]sr :<C-u>Unite neosnippet/runtime<CR>

"other shortcuts for vimfiler because of vimfiler overide many keys.
nnoremap [SHORTCUT]ub :Unite bookmark<CR>
nnoremap [SHORTCUT]uB :<C-u>Unite buffer<CR>
nnoremap [SHORTCUT]ut :<C-u>Unite tab<CR>

" :Unite menu:shortcut
let g:unite_source_menu_menus = {
			\   "shortcut" : {
			\       "description" : "shortcuts",
			\       "command_candidates" : [
			\           ["edit vimrc", "edit $MYVIMRC"],
			\           ["edit gvimrc", "edit $MYGVIMRC"],
			\       ],
			\   },
			\}

"data_directory 
if has('win32')
	"let g:unite_data_directory = 'c:\.unite'
elseif has('macunix')
	let g:unite_data_directory = '~/.vim/.unite'
else
	let g:unite_data_directory = '~/.unite'
endif

