
"normal mode emacs like keybind
nnoremap [NORMAL_EMACS]  <Nop>
inoremap [NORMAL_EMACS]<C-a> <C-o>^
inoremap [NORMAL_EMACS]<C-e> <C-o>$
inoremap [NORMAL_EMACS]<C-f> <C-o>w
inoremap [NORMAL_EMACS]<C-b> <C-o>b
inoremap [NORMAL_EMACS]<C-d> <C-o>x
inoremap [NORMAL_EMACS]<C-h> <C-o>h
inoremap [NORMAL_EMACS]<C-j> <C-o>j
inoremap [NORMAL_EMACS]<C-k> <C-o>k
inoremap [NORMAL_EMACS]<C-l> <C-o>l

"toggle settings


"reload vimrc and gvirc
if has('vim_starting')
  function s:reload_vimrc() abort
    execute printf('source %s', $MYVIMRC)
    if has('gui_running')
      execute printf('source %s', $MYGVIMRC)
    endif
    redraw
    echo printf('.vimrc/.gvimrc has reloaded (%s).', strftime('%c'))
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

