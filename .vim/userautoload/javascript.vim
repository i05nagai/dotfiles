function! s:javascript()

    "タブ文字の長さ
    setlocal tabstop=2
    setlocal shiftwidth=2

    " 空白文字ではなくてタブ文字を使用する
    setlocal expandtab

endfunction

" filetype が設定された場合に関数を呼ぶ
autocmd FileType javascript call s:javascript()

