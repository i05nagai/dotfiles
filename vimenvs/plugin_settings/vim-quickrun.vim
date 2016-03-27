
"Prefix
nnoremap [QUICKRUN]  <Nop>
nmap <Space>q [QUICKRUN]

"makeの割り当て
nnoremap [QUICKRUN]m :QuickRun make<CR>
let g:quickrun_config = {
\	"_" : {
\		"hook/close_unite_quickfix/enable_hook_loaded" : 1,
\		"hook/unite_quickfix/enable_failure" : 1,
\		"hook/close_quickfix/enable_exit" : 1,
\		"hook/close_buffer/enable_empty_data" : 1,
\		"hook/close_buffer/enable_failure" : 1,
\		"hook/time/enable" : 1,
\		"outputter" : "multi:buffer:quickfix",
\		"outputter/buffer/split" : ":botright 8sp",
\		"runner" : "vimproc",
\		"runner/vimproc/updatetime" : 40,
\	},
\	"make" : {
\		"command" : "make",
\		"exec" : "%c %o",
\		"hook/close_buffer/enable_success" : 1,
\		"outputter" : "error:buffer:quickfix",
\		"runner" : "vimproc",
\	},
\}


