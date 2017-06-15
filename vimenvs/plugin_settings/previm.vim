
augroup PrevimSettings
    autocmd!
    autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END

if has('mac')
	let g:previm_open_cmd = 'open'
elseif has('win32') || has ('win64')
	let g:previm_open_cmd = 'firefox'
else
	let g:previm_open_cmd ='firefox'
endif

