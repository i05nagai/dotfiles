function! s:groovy()
  setlocal tabstop=4
  setlocal shiftwidth=4
  setlocal expandtab
endfunction

autocmd FileType groovy call s:groovy()

