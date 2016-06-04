"disable arrow key
vnoremap  <Up>     <Nop>
vnoremap  <Down>   <Nop>
vnoremap  <Left>   <Nop>
vnoremap  <Right>  <Nop>
inoremap  <Up>     <Nop>
inoremap  <Down>   <Nop>
inoremap  <Left>   <Nop>
inoremap  <Right>  <Nop>
noremap   <Up>     <Nop>
noremap   <Down>   <Nop>
noremap   <Left>   <Nop>
noremap   <Right>  <Nop>

"insert mode emacs like keybind
inoremap [INSERT_EMACS] <Nop>
inoremap [INSERT_EMACS]<C-a> <C-o>^
inoremap [INSERT_EMACS]<C-e> <C-o>$
inoremap [INSERT_EMACS]<C-f> <C-o>w
inoremap [INSERT_EMACS]<C-b> <C-o>b
inoremap [INSERT_EMACS]<C-d> <C-o>x
inoremap [INSERT_EMACS]<C-h> <C-o>h
inoremap [INSERT_EMACS]<C-j> <C-o>j
inoremap [INSERT_EMACS]<C-k> <C-o>k
inoremap [INSERT_EMACS]<C-l> <C-o>l

"toggle settings

"reload vimrc and gvirc
if has('vim_starting')
  function s:reload_vimrc() abort
    execute printf('source %s', $MYVIMRC)
    if has('gui_running')
      execute printf('source %s', $MYGVIMRC)
    endif
    redraw
    echo printf('vimrc/gvimrc has reloaded (%s).', strftime('%c'))
  endfunction
endif
nmap <silent> <Plug>(my-reload-vimrc) :<C-u>call <SID>reload_vimrc()<CR>
nmap <Leader><Leader>r <Plug>(my-reload-vimrc)

" disable mouse middle click paste
map <MiddleMouse>   <Nop>
map <2-MiddleMouse> <Nop>
map <3-MiddleMouse> <Nop>
map <4-MiddleMouse> <Nop>
imap <MiddleMouse>   <Nop>
imap <2-MiddleMouse> <Nop>
imap <3-MiddleMouse> <Nop>
imap <4-MiddleMouse> <Nop>

" next window
nnoremap <Tab> <Nop>
nnoremap <Tab> <C-w>w
nnoremap <S-Tab> <Nop>
nnoremap <S-Tab> <C-w>p

"window size configuration
nnoremap <Up> <C-w>+
nnoremap <Down> <C-w>-
nnoremap <Left> <C-w><
nnoremap <Right> <C-w>>

"exchange displays line moving and linewise moving.
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

"delete default mapping to s key
nnoremap s <NOP>
vnoremap s <NOP>
nnoremap S <NOP>
vnoremap S <NOP>

"add keybind to  key
nnoremap [SHORTCUT] <NOP>
nmap s [SHORTCUT]

"shocrtcut to vifile
noremap [SHORTCUT]vi :tabedit $HOME/.vimrc<CR>
nnoremap [SHORTCUT]v_ :tabedit $HOME/_vimrc<CR>
nnoremap [SHORTCUT]vc :tabedit ~/.vim/basic_settings/common_settings.vim<CR>
nnoremap [SHORTCUT]vk :tabedit ~/.vim/basic_settings/keybind.vim<CR>
nnoremap [SHORTCUT]vp :tabedit ~/.vim/plugin_settings/<CR>
nnoremap [SHORTCUT]ve :tabedit ~/.vim/envs.vim<CR>

"-------------------register mapping----------------------
"---------------------------------------------------------
nmap <Leader>sp "sp<CR>
nnoremap [SHORTCUT]rp :let @* = getcwd()<CR>

"directory shortcut
nnoremap [SHORTCUT]dv :tabedit ~/.vim<CR>
nnoremap [SHORTCUT]dh :tabedit ~/<CR>

nnoremap <CR> :<C-u>w<CR>
"Escの2回押しでハイライト消去
nmap <esc><esc> :<C-u>nohlsearch<CR>

