function! s:javascript()
  setlocal tabstop=2
  setlocal shiftwidth=2
  setlocal expandtab
endfunction

autocmd FileType javascript call s:javascript()

