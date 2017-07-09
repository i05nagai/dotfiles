function! s:cmake()
    setlocal tabstop=4
    setlocal shiftwidth=4

    setlocal expandtab
endfunction

autocmd FileType cmake call s:cmake()

