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
" Maximum amount of memory in Kb to use for pattern matching. default 1000
set maxmempattern=10000
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

set switchbuf+=newtab

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

"------------------------tabline------------------------
"-------------------------------------------------------
if filereadable( $HOME . "/.vim/basic_settings/tabline.vim" )
  source ~/.vim/basic_settings/tabline.vim
endif

""---------------------------------------------------------
"" netrw
""---------------------------------------------------------
" Open a file with 'v' in right side panel. By default, left side.
let g:netrw_altv = 0
" tree view
let g:netrw_liststyle = 3
" Open a file with 'o' in bottom side panel. By default, upper side.
let g:netrw_alto = 1

""---------------------------------------------------------
"" dein
""---------------------------------------------------------

let $CACHE = expand('~/.cache')
if !($CACHE->isdirectory())
  call mkdir($CACHE, 'p')
endif
if &runtimepath !~# '/dein.vim'
  let s:dir = 'dein.vim'->fnamemodify(':p')
  if !(s:dir->isdirectory())
    let s:dir = $CACHE .. '/dein/repos/github.com/Shougo/dein.vim'
    if !(s:dir->isdirectory())
      execute '!git clone https://github.com/Shougo/dein.vim' s:dir
    endif
  endif
  execute 'set runtimepath^='
        \ .. s:dir->fnamemodify(':p')->substitute('[/\\]$', '', '')
endif

" Required:
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin(expand('~/.cache/dein'))

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" Add or remove your plugins here like this:
if !has('nvim')
  call dein#add('roxma/nvim-yarp')
  call dein#add('roxma/vim-hug-neovim-rpc')
endif
call dein#add('Shougo/vimproc', {
  \ 'build' : 'make all'
\ })
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('Shougo/deoplete.nvim')
call dein#add('Shougo/unite.vim')
call dein#add('tsukkee/unite-tag')
call dein#add('hewes/unite-gtags')
call dein#add('osyo-manga/unite-quickrun_config')
call dein#add('thinca/vim-quickrun')
call dein#add('Shougo/defx.nvim')
call dein#add('osyo-manga/shabadou.vim')
call dein#add('tpope/vim-surround')
call dein#add('mopp/next-alter.vim')
call dein#add('tyru/open-browser.vim')
call dein#add('junegunn/vim-easy-align')
call dein#add('LeafCage/yankround.vim')
call dein#add('vim-scripts/taglist.vim',
      \{'on_ft': ['c', 'cpp']})
call dein#add('itchyny/lightline.vim')
call dein#add('dhruvasagar/vim-table-mode')
"text-object
call dein#add('kana/vim-textobj-user')
call dein#add("bps/vim-textobj-python")
"git
call dein#add('tpope/vim-fugitive')
call dein#add('gregsexton/gitv')
"github
call dein#add('rhysd/github-complete.vim')
"doxygen
call dein#add('vim-scripts/DoxygenToolkit.vim')
"latex
call dein#add('vim-latex/vim-latex')
"jinja2
call dein#add("lepture/vim-jinja",
      \{'on_ft': ['jinja']})
"markdown
call dein#add('kannokanno/previm')
call dein#add("plasticboy/vim-markdown",
      \{'on_ft': ['markdown', 'md']})
call dein#add('mzlogin/vim-markdown-toc')
"restructuredText
call dein#add('gu-fan/riv.vim',
      \{'on_ft': ['rst']})
call dein#add('gu-fan/InstantRst',
      \{'on_ft': ['rst']})
"C++
call dein#add('rhysd/unite-n3337', {
      \ 'depends' : 'Shougo/unite.vim',
      \ 'on_ft' : ['cpp']
      \ })
"cmake
"NeoBundleLazy 'jalcine/cmake.vim', {
"  \ "autoload": {
"  \  "filetypes": ["cmake"],
"  \ },
"  \ "build": {
"  \  "mac": "rake",
"  \  "unix": "rake",
"  \ }}
"python
call dein#add("davidhalter/jedi-vim", {
      \    "on_ft": ["python", "python3", "djangohtml"],
      \ "build": {
      \   "mac": "git submodule update --init",
      \   "unix": "",
      \ }})
call dein#add("andviro/flake8-vim", {
      \   "on_ft": ["python", "python3", "djangohtml"],
      \ })
call dein#add("hynek/vim-python-pep8-indent", {
      \   "on_ft": ["python", "python3", "djangohtml"],
      \ })
call dein#add("heavenshell/vim-pydocstring", {
      \   "on_ft": ["python", "python3", "djangohtml"],
      \ })
"powershell
call dein#add('PProvost/vim-ps1')
" javascript
call dein#add('othree/yajs.vim', {
      \  'on_ft':['javascript']
      \  })
call dein#add('posva/vim-vue', {
      \  'on_ft':['vue']
      \  })
call dein#add('leafgarland/typescript-vim.git')
"coffee script
call dein#add('kchmck/vim-coffee-script')
"kotlin
call dein#add('udalov/kotlin-vim', {
      \ 'on_ft' : ['kotlin']
      \ })
" scala
call dein#add('derekwyatt/vim-scala', {
      \ 'on_ft' : ['scala']
      \ })
"terraform
call dein#add('hashivim/vim-terraform', {
      \ 'on_ft' : ['tf', 'terraform']
      \ })
" bazel
call dein#add('google/vim-maktaba')
call dein#add('bazelbuild/vim-bazel', {
      \ 'filetypes' : ['bzl']
      \ })
"swift
call dein#add('keith/swift.vim', {
      \ 'on_ft' : ['swift']
      \ })
"nginx
call dein#add('chr4/nginx.vim')
"go
call dein#add('fatih/vim-go', {
      \ 'on_ft' : ['go']
      \ })
"jenkinsfile
call dein#add('martinda/Jenkinsfile-vim-syntax')
"C#
call dein#add('nosami/Omnisharp', {
\   'on_ft': ['cs'],
\   'build': {
\     'windows': 'MSBuild.exe server/OmniSharp.sln /p:Platform="Any CPU"',
\     'mac': 'xbuild server/OmniSharp.sln',
\     'unix': 'xbuild server/OmniSharp.sln',
\   }
\ })

" To install,
" Execute :call dein#install()
" build :call dein#build()

" Required:
call dein#end()



"---------------------------------------------------------
"nvim-yarp
"---------------------------------------------------------
if filereadable( $HOME . "/.vim/plugin_settings/nvim-yarp.vim" )
  source ~/.vim/plugin_settings/nvim-yarp.vim
endif

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
"deoplete
"---------------------------------------------------------
if filereadable( $HOME . "/.vim/plugin_settings/deoplete.vim" )
  source ~/.vim/plugin_settings/deoplete.vim
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
" defx
"---------------------------------------------------------
if filereadable( $HOME . "/.vim/plugin_settings/defx.vim" )
  source ~/.vim/plugin_settings/defx.vim
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
if filereadable( $HOME . "/.vim/plugin_settings/doxygen_toolkit.vim" )
  source ~/.vim/plugin_settings/doxygen_toolkit.vim
endif

"---------------------------------------------------------
" open-browser
"---------------------------------------------------------
if filereadable( $HOME . "/.vim/plugin_settings/open-browser.vim" )
  source ~/.vim/plugin_settings/open-browser.vim
endif

"---------------------------------------------------------
" vim-easy-align
"---------------------------------------------------------
if filereadable( $HOME . "/.vim/plugin_settings/vim-easy-align.vim" )
  source ~/.vim/plugin_settings/vim-easy-align.vim
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
" InstantRst
"---------------------------------------------------------
if filereadable( $HOME . "/.vim/plugin_settings/instant_rst.vim" )
  source ~/.vim/plugin_settings/instant_rst.vim
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
" vim-scala
"---------------------------------------------------------
if filereadable( $HOME . "/.vim/plugin_settings/vim-scala.vim" )
  source ~/.vim/plugin_settings/vim-scala.vim
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
