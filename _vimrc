filetype off

"---------------------------------------------------------
" read common_settings
"---------------------------------------------------------
if filereadable( $HOME . "/.vim/basic_settings/common_settings.vim" )
  source ~/.vim/basic_settings/common_settings.vim
endif

if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim
endif
call neobundle#begin(expand('~/.vim/bundle/'))
	" originalrepos on github
	NeoBundle 'Shougo/vimshell.vim'
call neobundle#end()

"---------------------------------------------------------
"vim-shell
"---------------------------------------------------------
if filereadable( $HOME . "/.vim/plugin_settings/vimshell.vim" )
  source ~/.vim/plugin_settings/vimshell.vim
endif

"---------------------------------------------------------
" read einvironment settings
"---------------------------------------------------------
if filereadable( $HOME . "/.vim/envs.vim" )
  source ~/.vim/envs.vim
endif


"end of settings
"ファイルタイプの変更時自動読み込みする
filetype plugin indent on
syntax on

