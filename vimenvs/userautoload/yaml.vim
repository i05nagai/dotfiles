function! s:yaml()
    setlocal tabstop=2
    setlocal shiftwidth=2

    setlocal expandtab

    " 括弧を構成する設定に <> を追加する
    " template<> を多用するのであれば
    setlocal matchpairs+=<:>
endfunction

" filetype=cpp が設定された場合に関数を呼ぶ
autocmd FileType yaml call s:yaml()

