function! s:snippet()
    " hardtab
    setlocal noexpandtab
endfunction

" filetype=cpp が設定された場合に関数を呼ぶ
autocmd FileType snippet,neosnippet call s:snippet()
