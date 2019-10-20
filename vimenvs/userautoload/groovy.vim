function! s:groovy()
  setlocal tabstop=4
  setlocal shiftwidth=4
  " use space
  setlocal expandtab
  setlocal matchpairs+=<:>
endfunction

autocmd FileType groovy call s:groovy()
