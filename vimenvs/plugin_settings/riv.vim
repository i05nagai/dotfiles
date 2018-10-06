
" set auto folding level
" let g:riv_auto_fold_force = 0
" disable updaing folding
let g:riv_disable_folding = 1

" browser
if has('win32') || has('win64')

elseif has('unix')

elseif has('macunix')
  let g:riv_web_browser = '/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome'
endif

" templary build path. directory must exist
let g:riv_temp_path = '/tmp'
