"filetypeがonになった時点の設定を読み込むのでvimrcで弄る場合は最初off
filetype off

"---------------------------------------------------------
" read common_settings
"---------------------------------------------------------
if filereadable( $HOME . "/.vim/basic_settings/common_settings.vim" )
  source ~/.vim/basic_settings/common_settings.vim
endif

"end of settings
"ファイルタイプの変更時自動読み込みする
filetype plugin indent on
syntax on

