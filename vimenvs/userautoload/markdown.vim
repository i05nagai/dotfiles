function! s:markdown()

    "タブ文字の長さ
    setlocal tabstop=4
    setlocal shiftwidth=4

    setlocal expandtab
endfunction

" filetype=cpp が設定された場合に関数を呼ぶ
autocmd FileType markdown call s:markdown()

