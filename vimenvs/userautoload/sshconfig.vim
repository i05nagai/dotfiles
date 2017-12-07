function! s:sshconfig()
    setlocal tabstop=4
    setlocal shiftwidth=4
    setlocal expandtab
endfunction

" filetype=sshconfig
autocmd FileType sshconfig call s:sshconfig()

