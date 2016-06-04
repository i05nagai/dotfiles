
function! s:snippet()

    " 空白文字ではなくてタブ文字を使用する
    setlocal noexpandtab

endfunction

" filetype=cpp が設定された場合に関数を呼ぶ
autocmd FileType snippet,neosnippet call s:snippet()

