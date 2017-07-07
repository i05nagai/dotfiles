function! s:sh()

    setlocal tabstop=2
    setlocal shiftwidth=2
    setlocal expandtab
endfunction

" filetype=sh
autocmd FileType sh call s:sh()

