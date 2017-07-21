function! s:vim()
  setlocal tabstop=2
  setlocal shiftwidth=2
  setlocal expandtab
endfunction

" filetype=sql
autocmd FileType vim call s:vim()

