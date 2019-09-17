function! s:java()
    setlocal tabstop=4
    setlocal shiftwidth=4
    setlocal expandtab
endfunction

autocmd FileType java call s:java()
