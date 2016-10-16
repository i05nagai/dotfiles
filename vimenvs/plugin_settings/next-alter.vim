
"Prefix
nnoremap [NEXTALTER]  <Nop>
nmap <Space>n [NEXTALTER]

nnoremap [NEXTALTER] :<C-u>map [NEXTALTER]<CR>

nmap [NEXTALTER]o <Plug>(next-alter-open)

" key is file extension, value is alternate file extension.
let g:next_alter#pair_extension = {
            \ 'c'   : [ 'h' ],
            \ 'C'   : [ 'H' ],
            \ 'cc'  : [ 'h' ],
            \ 'CC'  : [ 'H', 'h'],
            \ 'cpp' : [ 'h', 'hpp' ],
            \ 'CPP' : [ 'H', 'HPP' ],
            \ 'cxx' : [ 'h', 'hpp' ],
            \ 'CXX' : [ 'H', 'HPP' ],
            \ 'h'   : [ 'c', 'cpp', 'cxx' ],
            \ 'H'   : [ 'C', 'CPP', 'CXX' ],
            \ 'hpp' : [ 'cpp', 'cxx'],
            \ 'HPP' : [ 'CPP', 'CXX'],
            \ }
" this list shows search directory to find alternate file.
let g:next_alter#search_dir = [ '.' , '..', './include', '../include' ]

" this is used when it opens alternate file buffer.
let g:next_alter#open_option = 'vertical topleft'

