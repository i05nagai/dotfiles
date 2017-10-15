function! s:snippet()
    " hardtab
    setlocal noexpandtab
endfunction

" filetype=neosnippet
autocmd FileType snippet call s:snippet()
autocmd FileType neosnippet call s:snippet()
