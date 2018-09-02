
" relation between extension and file type
" settings for hub issue create
autocmd BufRead,BufNewFile ISSUE_EDITMSG setfiletype hub_issue_editmsg.markdown
autocmd BufRead,BufNewFile *.es6 setfiletype javascript
autocmd BufRead,BufNewFile *.vue setfiletype vue.html.javascript.css
autocmd BufRead,BufNewFile *.kt setfiletype kotlin
autocmd BufRead,BufNewFile *.kts setfiletype kotlin
autocmd BufRead,BufNewFile *.swift setfiletype swift
autocmd BufRead,BufNewFile *.gitignore setfiletype gitignore
autocmd BufRead,BufNewFile *.pxd setfiletype cython
autocmd BufRead,BufNewFile *.pix setfiletype cython
autocmd BufRead,BufNewFile *.pyx setfiletype cython
"
" bazel
"
autocmd BufRead,BufNewFile *.BUILD setfiletype bzl
autocmd BufRead,BufNewFile WORKSPACE setfiletype bzl
autocmd BufRead,BufNewFile BUILD setfiletype bzl
