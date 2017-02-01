

" Disable Folding
let g:vim_markdown_folding_disabled = 1


" Allow for the TOC window to auto-fit when it's possible for it to shrink. It
" never increases its default size (half screen), it only shrinks.
let g:vim_markdown_toc_autofit = 1

"
let g:vim_markdown_emphasis_multiline = 0

" To disable conceal regardless of conceallevel setting, add the following to
" your .vimrc:
let g:vim_markdown_conceal = 0

" Syntax extensions

" LaTeX math
" Used as $x^2$, $$x^2$$, escapable as \$x\$ and \$\$x\$\$.
let g:vim_markdown_math = 1

" YAML Front Matter
let g:vim_markdown_frontmatter = 1
