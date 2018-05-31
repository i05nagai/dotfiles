function! s:c_style()
  " include path
  "setlocal path+=D:/home/cpp/boost,D:/home/cpp/sprout
  " indent option
  setlocal tabstop=2
  setlocal shiftwidth=2
  setlocal expandtab
  nnoremap <buffer><silent> <Space>ii :execute "?".&include<CR> :noh<CR> o
  "scope indent
  setlocal cino+=g0
  "Indent a function return type declaration N characters from the margin.  (default 'shiftwidth').
  setlocal cino+=t0
  " Indent C++ base class declarations and constructor initializations, if they start in a new line (otherwise they
  " are aligned at the right side of the ':').  (default 'shiftwidth').
  setlocal cino+=i0
  "When in unclosed parentheses and N is non-zero and either
  "  using "(0" or "u0", respectively and the unclosed parentheses is
  "  the last non-white character in its line and it is not the
  "  closing parentheses, indent the following line N characters
  "  relative to the outer context (i.e. start of the line or the
  "  next unclosed parentheses).  (default: 0).
  setlocal cino+=(0,W4
    syntax match boost_pp /BOOST_PP_[A-z0-9_]*/
    highlight link boost_pp cppStatement
endfunction

autocmd FileType c call s:c_style()
