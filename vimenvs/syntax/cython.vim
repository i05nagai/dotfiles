" Vim syntax file
" Language:	cython
" Maintainer:	
" URL:		
" Last Change:	

" quit when a syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

" Read the Python syntax to start with
runtime! syntax/python.vim
unlet b:current_syntax

" c type
syntax keyword cythonType const signed unsigned
syntax keyword cythonType size_t
syntax keyword cythonType char short int long bint
syntax keyword cythonType float double
syntax keyword cythonType void object

" typedef
syntax match cythonStatement display '\<ctypedef\>' nextgroup=cythonType skipwhite
syntax match cythonStatement display '\<typedef\>' nextgroup=cythonType skipwhite

" cython extentions
syn keyword cythonStatement cdef sizeof
syn keyword cythonStructure struct union enum
syn keyword cythonAccess public private property readonly extern
" If someome wants Python's built-ins highlighted probably he
" also wants Pyrex's built-ins highlighted
if exists("python_highlight_builtins") || exists("cython_highlight_builtins")
  syn keyword cythonBuiltin    NULL
endif

" cython
syntax keyword cythonDefine DEF IF ELIF ELSE

" gil
syntax match cythonStatement display '\<nogil:\?$'          containedin=cythonStatement
syntax match cythonStatement display '\<expect\ze?\?\>.*:$' containedin=cythonStatement

" This deletes "from" from the keywords and re-adds it as a
" match with lower priority than cythonForFrom
syntax clear   pythonInclude
syntax keyword cythonInclude include cimport
syntax keyword pythonInclude import
syntax match   pythonInclude "from"

" With "for[^:]*\zsfrom" VIM does not match "for" anymore, so
" I used the slower "\@<=" form
syn match   cythonForFrom        "\(for[^:]*\)\@<=from"

" Default highlighting
hi def link cythonStatement   Statement
hi def link cythonType    Type
hi def link cythonStructure   Structure
hi def link cythonInclude   PreCondit
hi def link cythonAccess    cythonStatement
if exists("python_highlight_builtins") || exists("cython_highlight_builtins")
  hi def link cythonBuiltin Function
endif
hi def link cythonForFrom   Statement


let b:current_syntax = "cython"

