function! s:dockerfile()
    setlocal tabstop=4
    setlocal shiftwidth=4

    setlocal expandtab
endfunction

autocmd FileType dockerfile call s:dockerfile()

