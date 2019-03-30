function! s:cucumber()
    setlocal tabstop=2
    setlocal shiftwidth=2
    " use space
    setlocal expandtab

    setlocal matchpairs+=<:>
endfunction

autocmd FileType cucumber call s:cucumber()
