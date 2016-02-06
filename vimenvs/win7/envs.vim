
"mklink .vim\plugin_settings\hoge.vim ..\..\vimenvs\plugin_settings\hoge.vim
set shell=%comspec%
set shellcmdflag=
set shellquote=\"
set shellxquote=

if has('win32')
	"パスのセパレータを変更(\->/)
	set shellslash
	"スペースの入ったファイル名も扱えるようにする
	set isfname+=32
endif

