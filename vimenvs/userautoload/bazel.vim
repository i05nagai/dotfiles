function! s:bzl()
    setlocal tabstop=4
    setlocal shiftwidth=4
    setlocal expandtab
endfunction

" call when filetype=cs is set
autocmd FileType bzl call s:bzl()
