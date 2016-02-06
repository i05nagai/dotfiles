
"スワップファイル用のディレクトリ
set directory=$HOME/.vim/vimbackup
"バックアップファイルを作るディレクトリ
set backupdir=$HOME/.vim/vimbackup
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
"
set encoding=utf-8
"
set fileencodings=utf-8,iso-2022-jp,cp932,sjis,euc-jp,utf-8
"
set cursorline
"hilight search
set hlsearch
set smartcase
set wrapscan "検索をファイルの先頭へループする

"C-vの矩形選択で行末より後ろもカーソルを置ける
set virtualedit=block

"color
set t_Co=256
"nocompatible with vi
set nocompatible

"-------------------register mapping----------------------
"---------------------------------------------------------
nmap <Leader>sp "sp<CR>

"---------------------------------------------------------
"key bind
"---------------------------------------------------------
if filereadable( $HOME . "/.vim/basic_settings/keybind.vim" )
  source ~/.vim/basic_settings/keybind.vim
endif

"---------------------------------------------------------
"diable default plugin
"---------------------------------------------------------
if filereadable( $HOME . "/.vim/basic_settings/disable_default_plugin.vim" )
  source ~/.vim/basic_settings/disable_default_plugin.vim
endif

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
	"call neobundle#rc(expand('~/.vim/bundle/'))
endif
call neobundle#begin(expand('~/.vim/bundle/'))
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
	NeoBundle 'vim-latex/vim-latex'
	NeoBundle 'vim-scripts/SingleCompile'
	NeoBundle 'mopp/next-alter.vim'
	NeoBundle 'thinca/vim-quickrun'
	NeoBundle 'tpope/vim-fugitive'
	NeoBundle 'superbrothers/vim-quickrun-markdown-gfm'
	NeoBundle 'h1mesuke/vim-alignta'
	NeoBundle 'vim-scripts/DoxygenToolkit.vim'
call neobundle#end()

"vi上から、:NeoBundleInstallで.vimrcのNeoBundleで指定されているリポジトリのプラグインをインストールできる。
"プラグインを削除したい場合は、vimrc上からNeoBundleの記述を消して:NeoBundleCleanでできる。

"---------------------------------------------------------
"unite
"---------------------------------------------------------
if filereadable( $HOME . "/.vim/plugin_settings/unite.vim" )
  source ~/.vim/plugin_settings/unite.vim
endif

"---------------------------------------------------------
"vimfiler
"---------------------------------------------------------
if filereadable( $HOME . "/.vim/plugin_settings/vimfiler.vim" )
  source ~/.vim/plugin_settings/vimfiler.vim
endif

"---------------------------------------------------------
"neocomplete and neocomplecache
"---------------------------------------------------------
if filereadable( $HOME . "/.vim/plugin_settings/neocomplete.vim" )
  source ~/.vim/plugin_settings/neocomplete.vim
endif

"---------------------------------------------------------
"neosnippet
"---------------------------------------------------------
if filereadable( $HOME . "/.vim/plugin_settings/neosnippet.vim" )
  source ~/.vim/plugin_settings/neosnippet.vim
endif

"---------------------------------------------------------
"vim-quickrun
"---------------------------------------------------------
if filereadable( $HOME . "/.vim/plugin_settings/vim-quickrun.vim" )
  source ~/.vim/plugin_settings/vim-quickrun.vim
endif

"---------------------------------------------------------
"Quickfix
"---------------------------------------------------------
if filereadable( $HOME . "/.vim/plugin_settings/Quickfix.vim" )
  source ~/.vim/plugin_settings/Quickfix.vim
endif

"---------------------------------------------------------
" SingleCompile
"---------------------------------------------------------
if filereadable( $HOME . "/.vim/plugin_settings/SingleCompile.vim" )
  source ~/.vim/plugin_settings/SingleCompile.vim
endif

"---------------------------------------------------------
" next-alter
"---------------------------------------------------------
if filereadable( $HOME . "/.vim/plugin_settings/next-alter.vim" )
  source ~/.vim/plugin_settings/next-alter.vim
endif

"---------------------------------------------------------
" vim-fugitive
"---------------------------------------------------------
if filereadable( $HOME . "/.vim/plugin_settings/vim-figutive.vim" )
  source ~/.vim/plugin_settings/vim-fugitive.vim
endif

"---------------------------------------------------------
" DoxygenToolkit
"---------------------------------------------------------
if filereadable( $HOME . "/.vim/plugin_settings/DoxygenToolkit.vim" )
  source "~/.vim/plugin_settings/DoxygenToolkit.vim"
endif

if filereadable( $HOME . "/.vim/envs.vim" )
  source ~/.vim/envs.vim
endif

set runtimepath+=~/.vim/
runtime! userautoload/*.vim

