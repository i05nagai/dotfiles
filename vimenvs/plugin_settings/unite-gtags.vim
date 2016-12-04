
"Prefix
nnoremap [UNITE-GTAGS]  <Nop>
nmap [UNITE]g [UNITE-GTAGS]

"show keymap
nnoremap [UNITE-GTAGS] :map [UNITE-GTAGS]<CR>

"You can specify <pattern> as an argument :Unite gtags/ref:<pattern>. 
nnoremap [UNITE-GTAGS]r :<C-u>Unite gtags/ref
"Unite gtags/def lists definitions of a word. (It executes global -qd -e <pattern> in internal.)
nnoremap [UNITE-GTAGS]d :<C-u>Unite gtags/def
"Unite gtags/grep lists grep result of a word. (It executes global -qg -e <pattern> in internal.)
nnoremap [UNITE-GTAGS]g :<C-u>Unite gtags/grep<CR>
"Unite gtags/completion lists all tokens in GTAGS. It executes global -c and show results.
nnoremap [UNITE-GTAGS]c :<C-u>Unite gtags/completion<CR>
" You can specify <pattern> as an argument :Unite gtags/file:<pathname>
nnoremap [UNITE-GTAGS]f :<C-u>Unite gtags/file
"You can specify <pattern> as an argument :Unite gtags/path:<pattern>.
nnoremap [UNITE-GTAGS]p :<C-u>Unite gtags/path:

