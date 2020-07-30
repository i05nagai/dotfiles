function! s:typescript()
    setlocal tabstop=2
    setlocal shiftwidth=2
    setlocal expandtab
endfunction

autocmd FileType typescript call s:typescript()
