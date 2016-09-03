" filetype=cpp が設定された時に呼ばれる関数
"Vim で C++ の設定を行う場合はこの関数内で記述する
function! s:cpp()
    " インクルードパスを設定する
    " gf などでヘッダーファイルを開きたい場合に影響する
    "setlocal path+=D:/home/cpp/boost,D:/home/cpp/sprout
	let $BOOST_ROOT = "/opt/local/include/boost"
	set path+=$BOOST_ROOT
	

    "タブ文字の長さ
    setlocal tabstop=4
    setlocal shiftwidth=4

    " 空白文字ではなくてタブ文字を使用する
    "setlocal noexpandtab
    setlocal expandtab

    " 括弧を構成する設定に <> を追加する
    " template<> を多用するのであれば
    setlocal matchpairs+=<:>

    " 最後に定義された include 箇所へ移動してを挿入モードへ
    nnoremap <buffer><silent> <Space>ii :execute "?".&include<CR> :noh<CR> o

    "indent option
	"scope indent
	setlocal cino+=g0
	"Indent a function return type declaration N characters from the margin.  (default 'shiftwidth').
	setlocal cino+=t0
	"Indent C++ base class declarations and constructor initializations, if they start in a new line (otherwise they
	" are aligned at the right side of the ':').  (default 'shiftwidth').
	setlocal cino+=i0
	"When in unclosed parentheses and N is non-zero and either
	"  using "(0" or "u0", respectively and the unclosed parentheses is
	"  the last non-white character in its line and it is not the
	"  closing parentheses, indent the following line N characters
	"  relative to the outer context (i.e. start of the line or the
	"  next unclosed parentheses).  (default: 0).
	setlocal cino+=(0,W4
    " BOOST_PP_XXX 等のハイライトを行う
    syntax match boost_pp /BOOST_PP_[A-z0-9_]*/
    highlight link boost_pp cppStatement
endfunction

" filetype=cpp が設定された場合に関数を呼ぶ
autocmd FileType cpp call s:cpp()

