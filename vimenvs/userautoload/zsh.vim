function! s:zsh()

    setlocal tabstop=2
    setlocal shiftwidth=2
    setlocal expandtab
endfunction

" filetype=sh
autocmd FileType zsh call s:zsh()

