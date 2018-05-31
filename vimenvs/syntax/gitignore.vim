" Vim syntax file
" Language: gitignore
" Maintainer: i05nagai
" Latest Revision: 26 April 2018

if exists("b:current_syntax")
  finish
endif

syn match gitignoreComment "#.*$"
hi def link gitignoreComment     Comment
