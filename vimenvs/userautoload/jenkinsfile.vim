function! s:jenkinsfile()
  setlocal tabstop=4
  setlocal shiftwidth=4
  setlocal expandtab
endfunction

autocmd FileType jenkinsfile call s:jenkinsfile()
