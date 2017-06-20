function! s:sql()

    setlocal tabstop=2
    setlocal shiftwidth=2
endfunction

" filetype=sql
autocmd FileType sql call s:sql()

