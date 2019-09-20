function! s:json()
  setlocal tabstop=2
  setlocal shiftwidth=2
  setlocal expandtab
  " formatting json file
  command! FormatJSON silent! %!python -c "import json, sys; print(json.dumps(json.load(sys.stdin), indent=4))"
endfunction

autocmd FileType json call s:json()

