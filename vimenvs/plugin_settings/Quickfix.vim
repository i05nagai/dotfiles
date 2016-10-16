
"Prefix
nnoremap [QUICKFIX]  <Nop>
nmap <Space>q [QUICKFIX]

"show keymap
nnoremap [QUICKFIX] :<C-u>map [QUICKFIX]<CR>

" open quickfix window
nnoremap [SHORTCUT]qo :copen<CR> 
" close quickfix window
nnoremap [SHORTCUT]qc :cclose<CR>
" display erorr list
nnoremap [SHORTCUT]ql :clist<CR> 
" 前へ
nnoremap [SHORTCUT]qp :cprevious<CR> 
" 次へ
nnoremap [SHORTCUT]qn :cnext<CR>       
" 最初へ
nnoremap [SHORTCUT]qb :<C-u>cfirst<CR> 
" 最後へ
nnoremap [SHORTCUT]qe :<C-u>clast<CR>  

