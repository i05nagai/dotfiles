"filetype off

"---------------------------------------------------------
" read common_settings
"---------------------------------------------------------
if filereadable( $HOME . "/.vim/basic_settings/common_settings.vim" )
  source ~/.vim/basic_settings/common_settings.vim
endif

call neobundle#begin(expand('~/.vim/bundle/'))
	" originalrepos on github
	NeoBundle 'Shougo/vimshell'
call neobundle#end()

"---------------------------------------------------------
"vim-shell
"---------------------------------------------------------
if filereadable( $HOME . "/.vim/plugin_settings/vimshell.vim" )
  source ~/.vim/plugin_settings/vimshell.vim
endif

"end of settings
"ファイルタイプの変更時自動読み込みする
filetype plugin indent on
syntax on

