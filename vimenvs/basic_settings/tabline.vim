" always show tab
set showtabline=2

" keymapping
nnoremap [TABCMD]  <Nop>
nmap     <leader>t [TABCMD]

nnoremap <silent> [TABCMD]f :<C-u>tabfirst<cr>
nnoremap <silent> [TABCMD]l :<C-u>tablast<cr>
nnoremap <silent> [TABCMD]n :<C-u>tabnext<cr>
nnoremap <silent> [TABCMD]N :<C-u>tabNext<cr>
nnoremap <silent> [TABCMD]p :<C-u>tabprevious<cr>
nnoremap <silent> [TABCMD]e :<C-u>tabedit
nnoremap <silent> [TABCMD]c :<C-u>tabclose<cr>
nnoremap <silent> [TABCMD]o :<C-u>tabonly<cr>
nnoremap <silent> [TABCMD]s :<C-u>tabs<cr>
nnoremap <silent> [TABCMD]g :<C-u>tabnext

"
" Customize tabline this works only for GUI vim
" for terminal vim tabline.vim
" name of tab
function! MyTabLabel(n)
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  let bufnr = buflist[winnr - 1]
  let file = bufname(bufnr)
  let buftype = getbufvar(bufnr, 'buftype')
  if buftype == 'nofile'
    if file =~ '\/.'
      let file = substitute(file, '.*\/\ze.', '', '')
    endif
  else
    let file = fnamemodify(file, ':p:t')
  endif
  if file == ''
    let file = '[No Name]'
  endif
  return file
endfunction
" tabline
function! MyTabLine()
  let s = ''
  for i in range(tabpagenr('$'))
    if i + 1 == tabpagenr()
      let s .= '%#TabLineSel#'
    else
      let s .= '%#TabLine#'
    endif
    let s .= '%' . (i+1) . 'T' 
    let s .= ' ' . (i+1) . (1==getwinvar(i+1,'&modified')?'[+]':'') . ' %{MyTabLabel(' . (i+1) . ')} '
  endfor
  let s .= '%#TabLineFill#%T'
  if tabpagenr('$') > 1 
    let s .= '%=%#TabLine#%999Xclose'
  endif
  return s
endfunction
set tabline=%!MyTabLine()
