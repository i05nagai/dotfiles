function! s:tf()
    setlocal tabstop=2
    setlocal shiftwidth=2
    setlocal expandtab
endfunction

" filetype=tf
autocmd FileType tf call s:tf()

" configuration for tfvars 
autocmd FileType terraform call s:tf()
