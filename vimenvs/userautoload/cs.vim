function! s:cs()
    setlocal tabstop=4
    setlocal shiftwidth=4
    " use hardtab
    "setlocal noexpandtab
    setlocal expandtab

    " consider <> as pair
    setlocal matchpairs+=<:>

endfunction

" call when filetype=cs is set
autocmd FileType cs call s:cs()
