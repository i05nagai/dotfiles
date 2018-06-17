"draw line
set colorcolumn=80
" backup and swap settings
set nowritebackup
set nobackup
set noswapfile
set directory=$HOME/.vim/vimbackup
set backupdir=$HOME/.vim/vimbackup
" show linenumber
set number
"
" indentaiton
"
" new line with current indentation
set autoindent
" newline with smart indentation
set smartindent
" the number of spaces for <Tab>
set tabstop=4
" the number of spaces for shift key indentation
set shiftwidth=4
"
" status line configurations
"
set laststatus=2
set statusline=%F%m%r%h%w\ [%{&fileencoding}:\%{&ff}]\[%Y]\ %=\[a=\%03.3b,\h=\%02.2B]\[p=%04l,%04v][%p%%:\%L行]
" disable alt key
set winaltkeys=no
"
set encoding=utf-8
"
set fileencodings=utf-8,iso-2022-jp,cp932,sjis,euc-jp,utf-8
" show an underline on the line on cursor
set cursorline
"
" serach
"
" hilight search
set hlsearch
set smartcase
" Search top of the file after reaching the end of files
set wrapscan
" show invisible characters
set list
set listchars=tab:»-,trail:-,nbsp:%

" allow  C-v to select chars after end of lines
set virtualedit=block

"color
set t_Co=256
"nocompatible with vi
set nocompatible

" spell check laguage excluded japanese
" :set spell if you want to check spell
set spelllang=en,cjk

" commandline completion
" this settings may be influenced by lightline.vim
set wildmenu wildmode=list:longest,full
" yank to clipboard
set clipboard+=unnamed

"---------------------------------------------------------
"key bind
"---------------------------------------------------------
if filereadable( $HOME . "/.vim/basic_settings/keybind.vim" )
  source ~/.vim/basic_settings/keybind.vim
endif

"---------------------------------------------------------
"diable default plugin
"---------------------------------------------------------
if filereadable( $HOME . "/.vim/basic_settings/disable_default_plugin.vim" )
  source ~/.vim/basic_settings/disable_default_plugin.vim
endif

"---------------------------------------------------------
"file type settings
"---------------------------------------------------------
if filereadable( $HOME . "/.vim/basic_settings/def_filetype.vim" )
  source ~/.vim/basic_settings/def_filetype.vim
endif

"-------------------Key mapping-------------------------
"-------------------------------------------------------
"-- <F6>  insert timestamp and change to insert mode ---
function! GetTimeStampInEnglish(type)
  let wday = strftime("%w")
  let mday = strftime("%m")
  let months = [ "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Non", "Dec" ]
  let weeks = [ "Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat" ]
  "Japanese
  if a:type == 1
    return strftime("%Y/%m/%d (". weeks[wday] .") %H:%M")
  "Amarican
  elseif a:type == 2
    return strftime(months[mday]."/%d/%Y (". weeks[wday] .") %H:%M")
  "Blighty
  else
    return strftime("%d/". months[mday] ."/%Y (". weeks[wday] .") %H:%M")
  endif
endfunction
nmap <F6> <ESC>i<C-R>=GetTimeStampInEnglish(3)<CR>

"------------------------Tab----------------------------
"-------------------------------------------------------
" always show tab
set showtabline=2

" keymapping
nnoremap [TABCMD]  <Nop>
nmap     <leader>t [TABCMD]

nnoremap <silent> [TABCMD]f :<C-u>tabfirst<cr>
nnoremap <silent> [TABCMD]l :<C-u>tablast<cr>
nnoremap <silent> [TABCMD]n :<C-u>tabnext<cr>
nnoremap <silent> [TABCMD]N :<C-u>tabNext<cr>
nnoremap <silent> [TABCMD]p :<C-u>tabprevious<cr>
nnoremap <silent> [TABCMD]e :<C-u>tabedit
nnoremap <silent> [TABCMD]c :<C-u>tabclose<cr>
nnoremap <silent> [TABCMD]o :<C-u>tabonly<cr>
nnoremap <silent> [TABCMD]s :<C-u>tabs<cr>
nnoremap <silent> [TABCMD]g :<C-u>tabnext

" Customize tabbar
" show tab number
set tabline=%!MyTabLine()
function! MyTabLine()
  let s = ''
  for i in range(tabpagenr('$'))
    if i + 1 == tabpagenr()
      let s .= '%#TabLineSel#'
    else
      let s .= '%#TabLine#'
    endif
    let s .= '%' . (i+1) . 'T' 
    let s .= ' ' . (i+1) . (1==getwinvar(i+1,'&modified')?'[+]':'') . ' %{MyTabLabel(' . (i+1) . ')} '
  endfor
  let s .= '%#TabLineFill#%T'
  if tabpagenr('$') > 1 
    let s .= '%=%#TabLine#%999Xclose'
  endif
  return s
endfunction

function! MyTabLabel(n)
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  return bufname(buflist[winnr - 1]) 
endfunction

""---------------------------------------------------------
"" netrw
""---------------------------------------------------------
" Open a file with 'v' in right side panel. By default, left side.
let g:netrw_altv = 0
" tree view
let g:netrw_liststyle = 3
" Open a file with 'o' in bottom side panel. By default, upper side.
let g:netrw_alto = 1

"---------------------------------------------------------
"NeoBundle
"---------------------------------------------------------
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif
call neobundle#begin(expand('~/.vim/bundle/'))
  "utilities
  NeoBundle 'Shougo/neobundle.vim'
  NeoBundle has('lua') ? 'Shougo/neocomplete' : 'Shougo/neocomplcache'
  NeoBundle 'Shougo/neosnippet'
  NeoBundle 'Shougo/neosnippet-snippets'
  NeoBundle 'shinespark/vim-list2tree'
  " unite
  NeoBundle 'Shougo/unite.vim'
  NeoBundle 'tsukkee/unite-tag'
  NeoBundle 'hewes/unite-gtags'
  NeoBundle 'osyo-manga/unite-quickrun_config'
  NeoBundle 'Shougo/vimproc', {
    \ 'build' : {
    \ 'windows' : 'make -f make_mingw64.mak',
    \ 'cygwin' : 'make -f make_cygwin.mak',
    \ 'mac' : 'make -f make_mac.mak',
    \ 'unix' : 'make -f make_unix.mak',
    \ },
  \ }
  NeoBundle 'Shougo/vimfiler.vim'
  NeoBundle 'thinca/vim-quickrun'
  NeoBundle 'osyo-manga/shabadou.vim'
  NeoBundle 'tpope/vim-surround'
  NeoBundle 'mopp/next-alter.vim'
  NeoBundle 'tyru/open-browser.vim'
  NeoBundle 'h1mesuke/vim-alignta'
  NeoBundle 'LeafCage/yankround.vim'
  NeoBundleLazy 'vim-scripts/taglist.vim', {
        \ 'autoload' : {'filetypes' : 'cpp'}
        \ }
  NeoBundle 'itchyny/lightline.vim'
  NeoBundle 'dhruvasagar/vim-table-mode'
  "text-object
  NeoBundle 'kana/vim-textobj-user'
  NeoBundle "bps/vim-textobj-python"
  "cmake
  "NeoBundleLazy 'jalcine/cmake.vim', {
  "  \ "autoload": {
  "  \  "filetypes": ["cmake"],
  "  \ },
  "  \ "build": {
  "  \  "mac": "rake",
  "  \  "unix": "rake",
  "  \ }}
  "git
  NeoBundle 'tpope/vim-fugitive'
  NeoBundle 'gregsexton/gitv'
  "github
  NeoBundle 'rhysd/github-complete.vim'
  "doxygen
  NeoBundle 'vim-scripts/DoxygenToolkit.vim'
  "latex
  NeoBundle 'vim-latex/vim-latex'
  "markdown
  NeoBundle 'kannokanno/previm'
  NeoBundleLazy "plasticboy/vim-markdown", {
        \ "autoload": {
        \   "filetypes": ["markdown", "md"],
        \ }}
  NeoBundle 'mzlogin/vim-markdown-toc'
  "restructuredText
  NeoBundle 'Rykka/riv.vim'
  "C++
  NeoBundleLazy 'rhysd/unite-n3337', {
        \ 'depends' : 'Shougo/unite.vim',
        \ 'autoload' : {'filetypes' : 'cpp'}
        \ }
  "python
  NeoBundleLazy "davidhalter/jedi-vim", {
        \ "autoload": {
        \   "filetypes": ["python", "python3", "djangohtml"],
        \ },
        \ "build": {
        \   "mac": "",
        \   "unix": "",
        \ }}
  NeoBundleLazy "andviro/flake8-vim", {
        \ "autoload": {
        \   "filetypes": ["python", "python3", "djangohtml"],
        \ },
        \ }
  NeoBundleLazy "hynek/vim-python-pep8-indent", {
        \ "autoload": {
        \   "filetypes": ["python", "python3", "djangohtml"],
        \ },
        \ }
  NeoBundleLazy "heavenshell/vim-pydocstring", {
        \ "autoload": {
        \   "filetypes": ["python", "python3", "djangohtml"],
        \ },
        \ }
  "powershell
  NeoBundle 'PProvost/vim-ps1'
  " javascript
  NeoBundleLazy 'othree/yajs.vim', {
        \'autoload': {
        \  'filetypes':['javascript']
        \  },
        \  }
  NeoBundleLazy 'posva/vim-vue', {
        \'autoload': {
        \  'filetypes':['vue']
        \  },
        \  }
  "coffee script
  NeoBundle 'kchmck/vim-coffee-script'
  "kotlin
  NeoBundleLazy 'udalov/kotlin-vim', {
        \ 'autoload' : {'filetypes' : 'kotlin'}
        \ }
  "terraform
  NeoBundleLazy 'hashivim/vim-terraform', {
        \ 'autoload' : {'filetypes' : 'tf'}
        \ }
  "swift
  NeoBundleLazy 'keith/swift.vim', {
        \ 'autoload' : {'filetypes' : 'swift'}
        \ }
  "nginx
  NeoBundle 'chr4/nginx.vim'
  "go
  NeoBundleLazy 'fatih/vim-go', {
        \ 'autoload' : {'filetypes' : 'go'}
        \ }
  "C#
  "NeoBundleLazy 'nosami/Omnisharp', {
  "\   'autoload': {'filetypes': ['cs']},
  "\   'build': {
  "\     'windows': 'MSBuild.exe server/OmniSharp.sln /p:Platform="Any CPU"',
  "\     'mac': 'xbuild server/OmniSharp.sln',
  "\     'unix': 'xbuild server/OmniSharp.sln',
  "\   }
  "\ }
call neobundle#end()

" To install,
" Execute :NeoBundleInstall
"
" To uninstall,
" Delete lines starting with NeoBundle ''. NeoBundle don't read undeclared plugins

"---------------------------------------------------------
"unite
"---------------------------------------------------------
if filereadable( $HOME . "/.vim/plugin_settings/unite.vim" )
  source ~/.vim/plugin_settings/unite.vim
endif

"---------------------------------------------------------
"unite-gtags
"---------------------------------------------------------
if filereadable( $HOME . "/.vim/plugin_settings/unite-gtags.vim" )
  source ~/.vim/plugin_settings/unite-gtags.vim
endif

"---------------------------------------------------------
"unite-quickrun_config
"---------------------------------------------------------
if filereadable( $HOME . "/.vim/plugin_settings/unite-quickrun_config.vim" )
  source ~/.vim/plugin_settings/unite-quickrun_config.vim
endif

"---------------------------------------------------------
"vimfiler
"---------------------------------------------------------
if filereadable( $HOME . "/.vim/plugin_settings/vimfiler.vim" )
  source ~/.vim/plugin_settings/vimfiler.vim
endif

"---------------------------------------------------------
"neocomplete and neocomplecache
"---------------------------------------------------------
if filereadable( $HOME . "/.vim/plugin_settings/neocomplete.vim" )
  source ~/.vim/plugin_settings/neocomplete.vim
endif

"---------------------------------------------------------
"neosnippet
"---------------------------------------------------------
if filereadable( $HOME . "/.vim/plugin_settings/neosnippet.vim" )
  source ~/.vim/plugin_settings/neosnippet.vim
endif

"---------------------------------------------------------
"vim-quickrun
"---------------------------------------------------------
if filereadable( $HOME . "/.vim/plugin_settings/vim-quickrun.vim" )
  source ~/.vim/plugin_settings/vim-quickrun.vim
endif

"---------------------------------------------------------
"Quickfix
"---------------------------------------------------------
if filereadable( $HOME . "/.vim/plugin_settings/Quickfix.vim" )
  source ~/.vim/plugin_settings/Quickfix.vim
endif

"---------------------------------------------------------
" next-alter
"---------------------------------------------------------
if filereadable( $HOME . "/.vim/plugin_settings/next-alter.vim" )
  source ~/.vim/plugin_settings/next-alter.vim
endif

"---------------------------------------------------------
" yankround
"---------------------------------------------------------
if filereadable( $HOME . "/.vim/plugin_settings/yankround.vim" )
  source ~/.vim/plugin_settings/yankround.vim
endif

"---------------------------------------------------------
" taglist
"---------------------------------------------------------
if filereadable( $HOME . "/.vim/plugin_settings/taglist.vim" )
  source ~/.vim/plugin_settings/taglist.vim
endif

"---------------------------------------------------------
" lightline
"---------------------------------------------------------
if filereadable( $HOME . "/.vim/plugin_settings/lightline.vim" )
  source ~/.vim/plugin_settings/lightline.vim
endif

"---------------------------------------------------------
" lightline
"---------------------------------------------------------
if filereadable( $HOME . "/.vim/plugin_settings/vim-table-mode.vim" )
  source ~/.vim/plugin_settings/vim-table-mode.vim
endif

"---------------------------------------------------------
" vim-textobj-python
"---------------------------------------------------------
if filereadable( $HOME . "/.vim/plugin_settings/vim-textobj-python.vim" )
  source ~/.vim/plugin_settings/vim-textobj-python.vim
endif

"---------------------------------------------------------
" cmake
"---------------------------------------------------------
if filereadable( $HOME . "/.vim/plugin_settings/cmake.vim" )
  source ~/.vim/plugin_settings/cmake.vim
endif

"---------------------------------------------------------
" vim-fugitive
"---------------------------------------------------------
if filereadable( $HOME . "/.vim/plugin_settings/vim-figutive.vim" )
  source ~/.vim/plugin_settings/vim-fugitive.vim
endif

"---------------------------------------------------------
" gitv
"---------------------------------------------------------
if filereadable( $HOME . "/.vim/plugin_settings/gitv.vim" )
  source ~/.vim/plugin_settings/gitv.vim
endif

"---------------------------------------------------------
" DoxygenToolkit
"---------------------------------------------------------
if filereadable( $HOME . "/.vim/plugin_settings/DoxygenToolkit.vim" )
  source ~/.vim/plugin_settings/DoxygenToolkit.vim
endif

"---------------------------------------------------------
" open-browser
"---------------------------------------------------------
if filereadable( $HOME . "/.vim/plugin_settings/open-browser.vim" )
  source ~/.vim/plugin_settings/open-browser.vim
endif

"---------------------------------------------------------
" previm
"---------------------------------------------------------
if filereadable( $HOME . "/.vim/plugin_settings/previm.vim" )
  source ~/.vim/plugin_settings/previm.vim
endif

"---------------------------------------------------------
" vim-markdonw
"---------------------------------------------------------
if filereadable( $HOME . "/.vim/plugin_settings/vim-markdown.vim" )
  source ~/.vim/plugin_settings/vim-markdown.vim
endif

"---------------------------------------------------------
" markdonw-toc
"---------------------------------------------------------
if filereadable( $HOME . "/.vim/plugin_settings/markdown-toc.vim" )
  source ~/.vim/plugin_settings/markdown-toc.vim
endif

"---------------------------------------------------------
" riv
"---------------------------------------------------------
if filereadable( $HOME . "/.vim/plugin_settings/riv.vim" )
  source ~/.vim/plugin_settings/riv.vim
endif

"---------------------------------------------------------
" jedi-vim
"---------------------------------------------------------
if filereadable( $HOME . "/.vim/plugin_settings/jedi-vim.vim" )
  source ~/.vim/plugin_settings/jedi-vim.vim
endif

"---------------------------------------------------------
" flake8-vim
"---------------------------------------------------------
if filereadable( $HOME . "/.vim/plugin_settings/flake8-vim.vim" )
  source ~/.vim/plugin_settings/flake8-vim.vim
endif

"---------------------------------------------------------
" vim-python-pep8-indent
"---------------------------------------------------------
if filereadable( $HOME . "/.vim/plugin_settings/vim-python-pep8-indent.vim" )
  source ~/.vim/plugin_settings/vim-python-pep8-indent.vim
endif

"---------------------------------------------------------
" vim-pydocstring
"---------------------------------------------------------
if filereadable( $HOME . "/.vim/plugin_settings/vim-pydocstring.vim" )
  source ~/.vim/plugin_settings/vim-pydocstring.vim
endif

"---------------------------------------------------------
" vim-vue
"---------------------------------------------------------
if filereadable( $HOME . "/.vim/plugin_settings/vim-vue.vim" )
  source ~/.vim/plugin_settings/vim-vue.vim
endif

"---------------------------------------------------------
" vim-coffee-script
"---------------------------------------------------------
if filereadable( $HOME . "/.vim/plugin_settings/vim-coffee-script.vim" )
  source ~/.vim/plugin_settings/vim-coffee-script.vim
endif

"---------------------------------------------------------
" kotlin-vim
"---------------------------------------------------------
if filereadable( $HOME . "/.vim/plugin_settings/kotlin-vim.vim" )
  source ~/.vim/plugin_settings/kotlin-vim.vim
endif

"---------------------------------------------------------
" vim-terraform
"---------------------------------------------------------
if filereadable( $HOME . "/.vim/plugin_settings/vim-terraform.vim" )
  source ~/.vim/plugin_settings/vim-terraform.vim
endif

"---------------------------------------------------------
" nginx.vim
"---------------------------------------------------------
if filereadable( $HOME . "/.vim/plugin_settings/nginx.vim" )
  source ~/.vim/plugin_settings/nginx.vim
endif

"---------------------------------------------------------
" vim-go
"---------------------------------------------------------
if filereadable( $HOME . "/.vim/plugin_settings/vim-go.vim" )
  source ~/.vim/plugin_settings/vim-go.vim
endif

if filereadable( $HOME . "/.vim/envs.vim" )
  source ~/.vim/envs.vim
endif

set runtimepath+=~/.vim/
runtime! userautoload/*.vim
