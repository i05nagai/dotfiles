function! s:python()
    "タブ文字の長さ
    setlocal tabstop=4
    setlocal shiftwidth=4

	setlocal smarttab
    setlocal expandtab

    " 括弧を構成する設定に <> を追加する
    " template<> を多用するのであれば
    setlocal matchpairs+=<:>
	setlocal commentstring="#%s"

    "indent option
	"scope indent
	setlocal cino+=g0
	setlocal indentkeys+=0#
	setlocal nosmartindent
endfunction

" filetype=python が設定された場合に関数を呼ぶ
autocmd FileType python call s:python()

