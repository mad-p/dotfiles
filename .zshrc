uname=`uname | tr A-Z a-z`

### environments
if [ -f ~/.proxyrc ]; then
  source ~/.proxyrc
fi

LANG=ja_JP.UTF-8
LC_MESSAGES=en_US.UTF-8

export PATH=$HOME/bin:/usr/local/sbin:/usr/local/bin:/usr/local/git/bin:$PATH
export MANPATH=$HOME/man:/usr/local/man:$MANPATH:/usr/local/git/share/man

export EDITOR=emacsclient

export SVN_EDITOR=$EDITOR
export GIT_EDITOR=$EDITOR
unset VISUAL
export PAGER=less
export LESS=R

export CLICOLOR=1
export LSCOLORS=exgxcxdxcxegedabagacad
export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

setopt APPEND_HISTORY
setopt SHARE_HISTORY
HISTFILE=$HOME/.zsh-history
HISTSIZE=110000
SAVEHIST=100000

umask 022
limit coredumpsize 20m

## shell interactions
autoload -U compinit
compinit

autoload -U colors
colors

bindkey -e
bindkey "^[^B" vi-backward-blank-word
bindkey "^[^L" vi-forward-blank-word
bindkey "^[l" forward-word
bindkey "^[f" down-case-word
bindkey "^L" forward-char
bindkey "^F" delete-char-or-list
bindkey "^Z" clear-screen

setopt auto_pushd
setopt chase_links
setopt pushd_ignore_dups

setopt always_last_prompt
setopt complete_in_word
zstyle ':completion:*:default' menu select
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' '+m:{A-Z}={a-z}'
setopt menu_complete
setopt list_packed
setopt auto_menu
setopt auto_list
setopt list_types
zmodload zsh/complist
bindkey -M menuselect '^r' vi-insert
bindkey -M menuselect '^s' vi-insert

setopt extended_glob
setopt numeric_glob_sort

setopt hist_expire_dups_first
setopt hist_no_store
setopt hist_reduce_blanks
setopt inc_append_history

setopt correct
setopt dvorak
setopt no_flow_control
setopt ignore_eof

setopt no_bg_nice
setopt nohup
setopt no_prompt_cr

## prompt

PROMPT0="%{%(#,${fg_bold[white]}${bg[black]},)%}%n@%m%{${reset_color}%} %{${fg_bold[blue]}%}%h%#%{${reset_color}%} "
PROMPT2="%{${fg[blue]}%}%_>%{${reset_color}%} "
SPROMPT="%{${fg[blue]}%}%r is correct? [n,y,a,e]:%{${reset_color}%} "

case "${TERM}" in
kterm*|xterm*|screen*)
    PROMPT=$(print "%{\e]2;%n@%m: %~\7%}$PROMPT0") # title bar
    ;;
*)
    PROMPT="$PROMPT0"
    ;;
esac

# source additional scripts
if [ -d ~/.zsh.d ]; then
  for f in ~/.zsh.d/*; do
    case `basename $f` in
    _*) ;; # ignore completion autoload files
    *)
        # echo "loading $f"
	source $f
	;;
    esac
  done
fi

## aliases
alias p=pushd
alias ,=popd
alias ..=pushd +2
alias r='bundle exec ./script/rails'
alias \?='dirs -v'
alias j='jobs'
alias e=emacsclient
alias man='LANG=C man'
alias emacs='LANG=C emacs'
alias zz=exit
alias ssh-agent-start='ssh-agent > ~/.ssh/agent; source ~/.ssh/agent; ssh-add'
alias ssh-agent-stop='eval `ssh-agent -k`; cp /dev/null ~/.ssh/agent'
alias ssh-agent-read='source ~/.ssh/agent; ssh-add -l'
function d () { colordiff -u $@ | diff-highlight | less -R; }

alias g='git'
alias gd='git diff'
alias gst='git status'
alias gl='git --no-pager log --oneline --decorate -8'
alias gg='gl --graph'
alias gd='git diff'
alias gdc='git diff --cached'
alias g='git'
alias st='git status'
alias gst='git status'
title() { export PROMPT=$PROMPT0; echo "\033]2;" $* "\007"}

[[ -d ~/.rbenv/bin ]] && export PATH="$HOME/.rbenv/bin:$PATH"

[ -f "$HOME/.zshrc_$uname" ] && source "$HOME/.zshrc_$uname"
[ -f "$HOME/.zshrc_local" ] && source "$HOME/.zshrc_local"
