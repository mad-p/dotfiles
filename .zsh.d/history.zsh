setopt APPEND_HISTORY
setopt SHARE_HISTORY
HISTFILE=$HOME/.zsh-history
HISTSIZE=210000
SAVEHIST=200000

zshaddhistory() {
    local line=${1%%$'\n'} #コマンドライン全体から改行を除去したもの
    local cmd=${line%% *}  # １つ目のコマンド
    # 以下の条件をすべて満たすものだけをヒストリに追加する
    [[ ${cmd} != (m|w|zz|,|\./[0-4][0-4])
        && ${cmd} != (gst|gg)
        && ${cmd} != (wordle)
    ]]
}
