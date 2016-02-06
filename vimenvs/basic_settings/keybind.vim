
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

