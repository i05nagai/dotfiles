function! s:vue()
  setlocal tabstop=2
  setlocal shiftwidth=2
  setlocal expandtab
endfunction

" filetype=vue
autocmd FileType vue call s:vue()
