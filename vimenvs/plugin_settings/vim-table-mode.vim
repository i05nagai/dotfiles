function! s:TableModeDefault() abort
  " markdown compatible
  :let g:table_mode_corner = '+'
  :let g:table_mode_separator = '|'
  :let g:table_mode_corner_corner = '|'
  :let g:table_mode_header_fillchar='-'
endfunction

" markdown compatible
function! s:TableModeMarkdownSetting() abort
  call s:TableModeDefault()
  :let g:table_mode_corner = '|'
endfunction
command! TableModeMarkdown call <SID>TableModeMarkdownSetting()

" restructuredText compatible
function! s:TableModeRestructuredTextSetting() abort
  call s:TableModeDefaultSetting()
  :let g:table_mode_corner_corner = '+'
  :let g:table_mode_header_fillchar = '='
endfunction
command! TableModeRestructuredText call <SID>TableModeRestructuredTextSetting()

" default
call s:TableModeMarkdownSetting()
