" Vim filetype plugin file
" Language:	cython
" Maintainer:	
" URL:		
" Last Change:	

" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif

" Behaves just like Python
runtime! ftplugin/python.vim ftplugin/python_*.vim ftplugin/python/*.vim

if has("gui_win32") && exists("b:browsefilter")
    let  b:browsefilter = "Pyrex files (*.pyx,*.pxd)\t*.pyx;*.pxd\n" .
      \ "Python Files (*.py)\t*.py\n" .
      \ "C Source Files (*.c)\t*.c\n" .
      \ "C Header Files (*.h)\t*.h\n" .
      \ "C++ Source Files (*.cpp *.c++)\t*.cpp;*.c++\n" .
      \ "All Files (*.*)\t*.*\n"
endif

let s:keepcpo= &cpo
set cpo&vim
let &cpo = s:keepcpo
unlet s:keepcpo

function! s:cython()
  setlocal tabstop=4
  setlocal shiftwidth=4
  setlocal smarttab
  setlocal expandtab

  setlocal matchpairs+=<:>
  setlocal commentstring="#%s"

  "indent option
  "scope indent
  setlocal cino+=g0
  setlocal indentkeys+=0#
  setlocal nosmartindent
endfunction

" filetype=cython 
autocmd FileType cython call s:cython()
