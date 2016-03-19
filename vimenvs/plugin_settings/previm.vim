
augroup PrevimSettings
    autocmd!
    autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END

if has('unix') 
	let g:previm_open_cmd = 'firefox'
elseif has('mac')
	let g:previm_open_cmd = 'open -a Firefox'
elseif has('win32') || has ('win64')
	let g:previm_open_cmd = 'firefox'
else
	let g:previm_open_cmd ='firefox'
endif

