function! s:bzl()
  setlocal tabstop=4
  setlocal shiftwidth=4

  setlocal expandtab
endfunction

autocmd FileType bzl call s:bzl()
