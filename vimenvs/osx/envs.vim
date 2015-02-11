""---------------------------------------------------------
"" Vim-LaTeX
""---------------------------------------------------------
" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on
" optional: This enables automatic indentation as you type.
filetype indent on
" important: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
" important: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*
" optional: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'
"自動折りたたみ無効
let g:TeX_AutoFolding = 0
let g:Tex_Folding = 0
let g:Imap_UsePlaceHolders = 1
let g:Imap_DeleteEmptyPlaceHolders = 1
let g:Imap_StickyPlaceHolders = 0
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_FormatDependency_pdf = 'dvi,pdf'
let g:Tex_FormatDependency_ps = 'dvi,ps'
let g:Tex_MultipleCompileFormats = 'pdf'
"let g:Tex_CompileRule_pdf = 'ptex2pdf -l -ot  -u -l -ot "-synctex=1 -interaction=nonstopmode -file-line-error-style" $*'
"let g:Tex_CompileRule_dvi = 'dvipdfmx $*.dvi' 
let g:Tex_CompileRule_dvi = 'uplatex -synctex=1 -interaction=nonstopmode -file-line-error-style $*'
let g:Tex_CompileRule_ps = 'dvips -Ppdf -o $*.ps $*.dvi'
let g:Tex_CompileRule_pdf = 'dvipdfmx $*.dvi' 
let g:Tex_BibtexFlavor = 'upbibtex'
let g:Tex_MakeIndexFlavor = 'mendex -U $*.idx'
let g:Tex_UseEditorSettingInDVIViewer = 1
let g:Tex_ViewRule_pdf = 'open -a Preview.app'
let g:Tex_ViewRule_ps = 'open'
let g:Tex_ViewRule_dvi = 'open'

let g:Tex_IgnoreLevel = 10
let g:Tex_IgnoredWarnings = 
	\"Underfull\n".
	\"Overfull\n".
	\"specifier changed to\n".
	\"You have requested\n".
	\"Missing number, treated as zero.\n".
	\"There were undefined references\n".
	\"Citation %.%# undefined\n".
	\"LaTeX Font Warning: Font shape `%s' undefined\n".
	\"LaTeX Font Warning: Some font shapes were not available, defaults substituted.\n".
	\"LaTeX Warning: Label(s) may have changed. Rerun to get cross-references right."


