
"Prefix
nnoremap [YANKROUND]  <Nop>
nmap <Space>y [YANKROUND]

let g:yankround_max_history = 35
let g:yankround_dir = '~/.cache/yankround'

"yank ring like keybind
nmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap gp <Plug>(yankround-gp)
nmap gP <Plug>(yankround-gP)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)

