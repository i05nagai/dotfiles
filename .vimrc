"filetypeがonになった時点の設定を読み込むのでvimrcで弄る場合は最初off
filetype off

"スワップファイル用のディレクトリ
set directory=$HOME/.vimbackup
"バックアップファイルを作るディレクトリ
set backupdir=$HOME/.vimbackup
"新しい行のインデントを現在行と同じにする
set autoindent
"行番号を表示する
set number
"新しい行を作ったときに高度な自動インデントを行う
set smartindent
"ファイル内の <Tab> が対応する空白の数
set tabstop=4
"インデントの大きさ
set shiftwidth=4
"ステータスラインの設定
set laststatus=2
set statusline=%F%m%r%h%w\ [%{&fileencoding}:\%{&ff}]\[%Y]\ %=\[a=\%03.3b,\h=\%02.2B]\[p=%04l,%04v][%p%%:\%L行]
"altkeyを押したときメニューが出るのを無効にする
set winaltkeys=no
"vi互換モードをoff
set nocp
"
set encoding=utf-8
"
set fileencodings=utf-8,iso-2022-jp,cp932,sjis,euc-jp,utf-8
"
set cursorline
"hilight search
set hlsearch
"color
set t_Co=256
"nocompatible
set nocompatible


" Enable mouse support.
set mouse=a
" For screen.
if &term =~ "^screen"
	augroup MyAutoCmd
		autocmd VimLeave * :set mouse=
	augroup END
" screenでマウスを使用するとフリーズするのでその対策
	set ttymouse=xterm2
endif
if has('gui_running')
	" Show popup menu if right click.
	set mousemodel=popup
	" Don't focus the window when the mouse pointer is moved.
	set nomousefocus
	" Hide mouse pointer on insert mode.
	set mousehide
endif


"-------------------register mapping-------------------------
"-------------------------------------------------------
nmap <Leader>sp "sp<CR>

"-------------------Key mapping-------------------------
"-------------------------------------------------------
nnoremap <CR> :<C-u>w<CR>
"Escの2回押しでハイライト消去
nmap <esc><esc> :<C-u>nohlsearch<CR>
"--- <F6>  タイムスタンプを挿入してinsertモードへ移行 ----
function! GetTimeStampInEnglish(type)
	let wday = strftime("%w")
	let mday = strftime("%m")
	let months = [ "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Non", "Dec" ]
	let weeks = [ "Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat" ]
	"Japanese
	if a:type == 1
		return strftime("%Y/%m/%d (". weeks[wday] .") %H:%M")
	"Amarican
	elseif a:type == 2
		return strftime(months[mday]."/%d/%Y (". weeks[wday] .") %H:%M")
	"Blighty
	else
		return strftime("%d/". months[mday] ."/%Y (". weeks[wday] .") %H:%M")
	endif
endfunction
nmap <F6> <ESC>i<C-R>=GetTimeStampInEnglish(3)<CR>

"-------------------タブ関連設定------------------------
"-------------------------------------------------------
"常にタブを表示
set showtabline=2

" キーマッピング
nnoremap [TABCMD]  <Nop>
nmap     <leader>t [TABCMD]

nnoremap <silent> [TABCMD]f :<C-u>tabfirst<cr>
nnoremap <silent> [TABCMD]l :<C-u>tablast<cr>
nnoremap <silent> [TABCMD]n :<C-u>tabnext<cr>
nnoremap <silent> [TABCMD]N :<C-u>tabNext<cr>
nnoremap <silent> [TABCMD]p :<C-u>tabprevious<cr>
nnoremap <silent> [TABCMD]e :<C-u>tabedit
nnoremap <silent> [TABCMD]c :<C-u>tabclose<cr>
nnoremap <silent> [TABCMD]o :<C-u>tabonly<cr>
nnoremap <silent> [TABCMD]s :<C-u>tabs<cr>
nnoremap <silent> [TABCMD]g :<C-u>tabnext

"タブ一覧の行の設定
"タブの番号を表示する
set tabline=%!MyTabLine()
function! MyTabLine()
	let s = ''
	for i in range(tabpagenr('$'))
		if i + 1 == tabpagenr()
			let s .= '%#TabLineSel#'
		else
			let s .= '%#TabLine#'
		endif
		let s .= '%' . (i+1) . 'T' 
		let s .= ' ' . (i+1) . (1==getwinvar(i+1,'&modified')?'[+]':'') . ' %{MyTabLabel(' . (i+1) . ')} '
	endfor
	let s .= '%#TabLineFill#%T'
	if tabpagenr('$') > 1 
		let s .= '%=%#TabLine#%999Xclose'
	endif
	return s
endfunction

function! MyTabLabel(n)
	let buflist = tabpagebuflist(a:n)
	let winnr = tabpagewinnr(a:n)
	return bufname(buflist[winnr - 1]) 
endfunction

""---------------------------------------------------------
"" netrw 
""---------------------------------------------------------
" 'v'でファイルを開くときは右側に開く。(デフォルトが左側なので入れ替え)
let g:netrw_altv = 0
" netrwは常にtree view
let g:netrw_liststyle = 3
" 'o'でファイルを開くときは下側に開く。(デフォルトが上側なので入れ替え)
let g:netrw_alto = 1


"---------------------------------------------------------
"NeoBundle
"---------------------------------------------------------
if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim
	call neobundle#rc(expand('~/.vim/bundle/'))
endif
" originalrepos on github
NeoBundle 'Shougo/neobundle.vim'
NeoBundle has('lua') ? 'Shougo/neocomplete' : 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
    \ 'windows' : 'make -f make_mingw32.mak',
    \ 'cygwin' : 'make -f make_cygwin.mak',
    \ 'mac' : 'make -f make_mac.mak',
    \ 'unix' : 'make -f make_unix.mak',
  \ },
\ }
NeoBundle 'tpope/vim-surround'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'git://git.code.sf.net/p/vim-latex/vim-latex'

""NeoBundle 'https://bitbucket.org/kovisoft/slimv'

"vi上から、:NeoBundleInstallで.vimrcのNeoBundleで指定されているリポジトリのプラグインをインストールできる。
"プラグインを削除したい場合は、vimrc上からNeoBundleの記述を消して:NeoBundleCleanでできる。


"---------------------------------------------------------
"unite
"---------------------------------------------------------
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

"data_directory 
if has('win32')
	"let g:unite_data_directory = 'c:\.unite'
elseif has('macunix')
	let g:unite_data_directory = '~/.vim/.unite'
else
	let g:unite_data_directory = '~/.unite'
endif


"---------------------------------------------------------
"vimfiler
"---------------------------------------------------------
"Prefix
nnoremap [VIMFILER]  <Nop>
nmap <Space>f [VIMFILER]

let g:vimfiler_as_default_explorer = 1

"custom commands
"let g:vimfiler_edit_action = 'edit'
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

"---------------------------------------------------------
"neocomplete and neocomplecache
"---------------------------------------------------------
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
"スニペットファイルの置き場所
let g:neocomplcache_snippets_dir = '~/.vim/bundle/neosnippet/autoload/neosnippet/snippets'


"---------------------------------------------------------
"neosnippet
"---------------------------------------------------------
" " Plugin key-mappings.
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
" For snippet_complete marker.
" texの数式も隠れるので
if has('conceal')
	"set conceallevel=2 concealcursor=i
endif

"---------------------------------------------------------
"Quickrun
"---------------------------------------------------------
"makeの割り当て
nnoremap <Space>qmake :QuickRun make<CR>
let g:quickrun_config = {
\	"_" : {
\		"hook/close_unite_quickfix/enable_hook_loaded" : 1,
\		"hook/unite_quickfix/enable_failure" : 1,
\		"hook/close_quickfix/enable_exit" : 1,
\		"hook/close_buffer/enable_empty_data" : 1,
\		"hook/close_buffer/enable_failure" : 1,
\		"hook/time/enable" : 1,
\		"outputter" : "multi:buffer:quickfix",
\		"outputter/buffer/split" : ":botright 8sp",
\		"runner" : "vimproc",
\		"runner/vimproc/updatetime" : 40,
\	},
\	"make" : {
\		"command" : "make",
\		"exec" : "%c %o",
\		"hook/close_buffer/enable_success" : 1,
\		"outputter" : "error:buffer:quickfix",
\		"runner" : "vimproc",
\	},
\}

if filereadable( $HOME . "/.vim/envs.vim" )
  source ~/.vim/envs.vim
endif

set runtimepath+=~/.vim/
runtime! userautoload/*.vim

"ファイルタイプの変更時自動読み込みする
filetype plugin indent on
syntax on
