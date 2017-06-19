export LANG=ja_JP.UTF-8
export LANG_ALL=ja_JP.UTF-8
export TERM=xterm-256color

#autoload
autoload -Uz compinit
compinit 
autoload -Uz colors
colors
autoload history-search-end
# VCSの情報を取得するzshの便利関数 vcs_infoを使う
autoload -Uz vcs_info

# General
# keybind
#Ctrl-A	行頭へジャンプ
#Ctrl-E	行末へジャンプ
#Ctrl-Y	ヤンク
#Ctrl-X U	アンドゥ
#Ctrl-@	マークセット
#Ctrl-K	カーソルから行末までを削除
#Ctrl-W	カーソルから行頭までを削除
#Ctrl-U	一行削除
#Ctrl-G	コマンド入力を実行せずに無視して次の行へ
#Ctrl-B	←キー
#Ctrl-F	→キー
#Ctrl-P	↑キー
#Ctrl-N	↓キー
#Ctrl-D	Deleteキー
#Ctrl-H	BackSpaceキー
#Ctrl-I	展開または補完
#Ctrl-L	クリアスクリーン
# delete current keybind
bindkey -d
# use emacs keybind
bindkey -e
bindkey "^J^J" push-line

# options
setopt auto_resume
setopt no_beep
setopt no_clobber
setopt no_hup
setopt no_multios
setopt magic_equal_subst
setopt notify
setopt numeric_glob_sort
setopt print_eight_bit

###Completion
#di: ディレクトリ
#ln: シンボリックリンク
#so: ソケットファイル
#pi: FIFOファイル
#ex: 実行ファイル
#bd: ブロックスペシャルファイル
#cd: キャラクタスペシャルファイル
#su: setuidつき実行ファイル
#sg: setgidつき実行ファイル
#tw: スティッキビットありother書き込み権限つきディレクトリ
#ow: スティッキビットなしother書き込み権限つきディレクトリ
#00: なにもしない
#01: 太字化
#04: 下線
#05: 点滅
#07: 前背色反転
#08: 表示しない
#22: ノーマル化
#24: 下線なし
#25: 点滅なし
#27: 前背色反転なし
#30: 黒(前景色)
#31: 赤(前景色)
#32: 緑(前景色)
#33: 茶(前景色)
#34: 青(前景色)
#35: マゼンタ(前景色)
#36: シアン(前景色)
#37: 白(前景色)
#39: デフォルト(前景色)
#40: 黒(背景色)
#41: 赤(背景色)
#42: 緑(背景色)
#43: 茶(背景色)
#44: 青(背景色)
#45: マゼンタ(背景色)
#46: シアン(背景色)
#47: 白(背景色)
#49: デフォルト(背景色)
zstyle ':completion:*' list-colors 'di=01;34' 'ln=01;36' 'so=01;41;37' 'ex=01;32' 'su=41;30' 'sg=41;30' 'bd=01;46;34' 'cd=01;43;34'
#補完のときプロンプトの位置を変えない
setopt always_last_prompt
#補完候補が複数あるとき自動でメニューをリストアップ
setopt auto_list
#ディレクトリ 補完 /を付与
setopt auto_param_slash
##スペースで /を削除
setopt auto_remove_slash
#補完要求に対してメニューをリストアップ
setopt auto_menu
#
setopt auto_param_keys
#command correct edition before each completion attempt
setopt correct
#
setopt extended_glob
# compacked complete list display
setopt list_packed
##補完の表示を水平方向に
setopt list_rows_first
#補完候補の表示を親切に ls -F
## /がディレクトリ
## @がシンボリックリンク
setopt list_types
#
setopt mark_dirs
#
setopt no_menu_complete

###Directory
setopt auto_cd
# auto directory pushd that you can get dirs list by cd -[tab]
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushd_to_home


###History
# Command history configuration
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_all_dups     # ignore duplication command history list
setopt hist_no_store
setopt hist_reduce_blanks
setopt share_history
# historical backward/forward search with linehead string binded to ^P/^N
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "" history-beginning-search-backward-end
bindkey "" history-beginning-search-forward-end 


### vcs's settings
# 表示フォーマットの指定
# %b ブランチ情報
# %a アクション名(mergeなど)
zstyle ':vcs_info:*' formats '[%b]'
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
# バージョン管理されているディレクトリにいれば表示，そうでなければ非表示
RPROMPT="%1(v|%F{green}%1v%f|)"


### Prompt
local p_cdir="%B%{[35m%}[%~]%{[1;37m%}%b"$'\n'
local p_info="${USER}"
#直前のコマンドがエラーなら赤色
local p_mark="%B%(?,%{[35m%},%{[31m%})%(!,#,%%)%{[1;37m%}%b"
#通常
PROMPT="$p_cdir$p_info $p_mark "
#while,for
PROMPT2="%B(%_) %(!#,>)%b "
#入力ミス
SPROMPT="%B%{[31m%}%r is correct? [n,y,a,e]:%{[m%}%b "


### alias/export/PATH/
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Editor
export EDITOR="vim"

# history file for less
export LESSHISTFILE=-

### Environments senttings
source ~/.zshrc.env

if [ ! -d $HOME/.vimbackup ]; then
	mkdir $HOME/.vimbackup
fi


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
