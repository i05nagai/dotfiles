function! s:ruby()
    setlocal tabstop=2
    setlocal shiftwidth=2
    setlocal expandtab
endfunction

" call when filetype is set
autocmd FileType ruby call s:ruby()

