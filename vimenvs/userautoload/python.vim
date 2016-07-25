function! s:python()
    "タブ文字の長さ
    setlocal tabstop=4
    setlocal shiftwidth=4

    setlocal expandtab

    " 括弧を構成する設定に <> を追加する
    " template<> を多用するのであれば
    setlocal matchpairs+=<:>

    "indent option
	"scope indent
	setlocal cino+=g0
endfunction

" filetype=cpp が設定された場合に関数を呼ぶ
autocmd FileType python call s:python()

