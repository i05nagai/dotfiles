function! s:html()
    "タブ文字の長さ
    setlocal tabstop=2
    setlocal shiftwidth=2

    " use space
    setlocal expandtab
    setlocal matchpairs+=<:>

    vmap <silent> ;h :s?^\(\s*\)+ '\([^']\+\)',*\s*$?\1\2?g<CR>
    vmap <silent> ;q :s?^\(\s*\)\(.*\)\s*$? \1 + '\2'?<CR>
endfunction

" filetype=cpp が設定された場合に関数を呼ぶ
autocmd FileType html call s:html()

