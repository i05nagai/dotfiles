
" Prefix
nnoremap [UNITE]  <Nop>
nmap <Space>u [UNITE]

" start normal mode
let g:unite_enable_start_insert = 0
" buffer
nnoremap [UNITE]b :<C-u>Unite buffer<CR>
" open current directory
nnoremap [UNITE]f :<C-u>UniteWithBufferDir file<CR>
" Most Recently used file
nnoremap [UNITE]m :<C-u>Unite file_mru<CR>
" open unite in vertical window
nnoremap [UNITE]v :vsplit<CR>:<C-u>UniteWithBufferDir -buffer-name=files buffer bookmark file<CR>
" register
nnoremap <silent> [UNITE]r :<C-u>Unite -buffer-name=register register<CR>
" tab
nnoremap [UNITE]t :<C-u>Unite tab<CR>
" neosnippet/user
nnoremap [UNITE]su :<C-u>Unite neosnippet/user<CR>
nnoremap [UNITE]sr :<C-u>Unite neosnippet/runtime<CR>

" other shortcuts for vimfiler because of vimfiler overide many keys.
nnoremap [SHORTCUT]ub :Unite bookmark<CR>
nnoremap [SHORTCUT]uB :<C-u>Unite buffer<CR>
nnoremap [SHORTCUT]ut :<C-u>Unite tab<CR>

"
" shortcut
"
let g:unite_source_menu_menus = get(g:,'unite_source_menu_menus',{})
" :Unite menu:<command> e.g. :Unite menu:git
let g:unite_source_menu_menus = {
\   "shortcut" : {
\       "description" : "shortcuts",
\       "command_candidates" : [
\           ["edit vimrc", "edit $MYVIMRC"],
\           ["edit gvimrc", "edit $MYGVIMRC"],
\       ],
\   },
\   "git" : {
\       "description" : "git repository",
\       "command_candidates" : [
\         ['▷ tig                                     ⌘ ,gt', 'normal ,gt'],
\         ['▷ git status       (Fugitive)             ⌘ ,gs', 'Gstatus'],
\         ['▷ git diff         (Fugitive)             ⌘ ,gd', 'Gdiff'],
\         ['▷ git commit       (Fugitive)             ⌘ ,gc', 'Gcommit'],
\         ['▷ git log          (Fugitive)             ⌘ ,gl', 'exe "silent Glog | Unite quickfix"'],
\         ['▷ git blame        (Fugitive)             ⌘ ,gb', 'Gblame'],
\         ['▷ git stage        (Fugitive)             ⌘ ,gw', 'Gwrite'],
\         ['▷ git checkout     (Fugitive)             ⌘ ,go', 'Gread'],
\         ['▷ git rm           (Fugitive)             ⌘ ,gr', 'Gremove'],
\         ['▷ git mv           (Fugitive)             ⌘ ,gm', 'exe "Gmove " input("path: ")'],
\         ['▷ git push         (Fugitive)             ⌘ ,gp', 'Git! push'],
\         ['▷ git pull         (Fugitive)             ⌘ ,gP', 'Git! pull'],
\         ['▷ git prompt       (Fugitive)             ⌘ ,gi', 'exe "Git! " input("command git: ")'],
\         ['▷ git cd           (Fugitive)', 'Gcd'],
\       ],
\   },
\}

" data_directory 
if has('win32')
  "let g:unite_data_directory = 'c:\.unite'
elseif has('macunix')
  let g:unite_data_directory = '~/.vim/.unite'
else
  let g:unite_data_directory = '~/.unite'
endif
