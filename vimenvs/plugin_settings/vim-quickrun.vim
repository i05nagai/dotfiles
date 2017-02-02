
"Prefix
nnoremap [QUICKRUN]  <Nop>
nmap <Space>r [QUICKRUN]

"show keymap
nnoremap [QUICKRUN] :map [QUICKRUN]<CR>
" keymap
nnoremap [QUICKRUN]ca :QuickRun cpp/cmake/all<CR>
nnoremap [QUICKRUN]cc :QuickRun cpp/cmake/configure<CR>
nnoremap [QUICKRUN]cm :QuickRun cpp/cmake/make<CR>
nnoremap [QUICKRUN]ct :QuickRun cpp/cmake/test<CR>

let g:quickrun_config = {
\	"_" : {
\		"hook/close_buffer/enable_empty_data" : 1,
\		"hook/close_buffer/enable_failure" : 1,
\		"hook/close_buffer/enable_success" : 1,
\		"hook/close_quickfix/enable_success" : 1,
\		"hook/close_unite_quickfix/enable_hook_loaded" : 1,
\		"hook/time/enable" : 1,
\		"hook/unite_quickfix/enable_failure" : 1,
\		"outputter" : "multi:buffer:quickfix",
\		"outputter/buffer/split" : "vertical rightbelow",
\		"runner" : "vimproc",
\		"runner/vimproc/updatetime" : 40,
\	},
\	"cpp/make" : {
\		"command" : "make",
\		"exec" : "%c %o",
\		"hook/close_buffer/enable_success" : 1,
\		"outputter" : "error:buffer:quickfix",
\		"runner" : "vimproc",
\	},
\	"cpp/cmake/all" : {
\		"command" : "cmake",
\		"exec" : ["%c .", "make", "ctest -V"],
\		"outputter" : "error:buffer:quickfix",
\		"runner" : "vimproc",
\	},
\	"cpp/cmake/configure" : {
\		"command" : "cmake",
\		"exec" : "%c .",
\		"runner" : "vimproc",
\	},
\	"cpp/cmake/configure/debug" : {
\		"command" : "cmake",
\		"exec" : "%c -DCMAKE_BUILD_TYPE=Debug .",
\		"runner" : "vimproc",
\	},
\	"cpp/cmake/configure/release" : {
\		"command" : "cmake",
\		"exec" : "%c -DCMAKE_BUILD_TYPE=Release .",
\		"runner" : "vimproc",
\	},
\	"cpp/cmake/make" : {
\		"command" : "make",
\		"exec" : "%c",
\		"runner" : "vimproc",
\	},
\	"cpp/cmake/test" : {
\		"command" : "ctest",
\		"exec" : "%c -V",
\		"runner" : "vimproc",
\	},
\}

