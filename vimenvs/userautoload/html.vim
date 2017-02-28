function! s:html()
    "タブ文字の長さ
    setlocal tabstop=2
    setlocal shiftwidth=2

	" use space
    setlocal expandtab

    setlocal matchpairs+=<:>

endfunction

" filetype=cpp が設定された場合に関数を呼ぶ
autocmd FileType html call s:html()
