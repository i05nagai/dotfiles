function! s:neosnippet()
    " hardtab
    setlocal noexpandtab
endfunction

" filetype=neosnippet
autocmd FileType neosnippet call s:neosnippet()
