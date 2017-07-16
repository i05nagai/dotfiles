function! s:json()
    setlocal tabstop=2
    setlocal shiftwidth=2
    setlocal expandtab
endfunction

autocmd FileType json call s:json()

