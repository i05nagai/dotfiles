function! s:cs()
    "タブ文字の長さ
    setlocal tabstop=4
    setlocal shiftwidth=4

    " 空白文字ではなくてタブ文字を使用する
    "setlocal noexpandtab
    setlocal expandtab

    " 括弧を構成する設定に <> を追加する
    " template<> を多用するのであれば
    setlocal matchpairs+=<:>

endfunction

" filetype=cpp が設定された場合に関数を呼ぶ
autocmd FileType cs call s:cs()

