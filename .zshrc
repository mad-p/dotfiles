uname=`uname | tr A-Z a-z`

### environments
if [ -f ~/.proxyrc ]; then
  source ~/.proxyrc
fi

LANG=ja_JP.UTF-8
LC_MESSAGES=en_US.UTF-8

if [ -x /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ -x /usr/local/Homebrew/bin/brew ]; then
  eval "$(/usr/local/Homebrew/bin/brew shellenv)"
fi
export PATH=$HOME/bin:$PATH

export MANPATH=$HOME/man:$MANPATH

export EDITOR=emacsclient

export SVN_EDITOR=$EDITOR
export GIT_EDITOR=$EDITOR
unset VISUAL
export PAGER=less
export LESS=R
export GROOVY_HOME=/usr/local/opt/groovy/libexec

export CLICOLOR=1
export LSCOLORS=exgxcxdxcxegedabagacad
export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

setopt combining_chars

umask 022
limit coredumpsize 20m

## shell interactions
autoload -U compinit
compinit

autoload -U colors
colors

bindkey -e
#bindkey "^[^B" vi-backward-blank-word
#bindkey "^[^L" vi-forward-blank-word
#bindkey "^[l" forward-word
#bindkey "^[f" down-case-word
#bindkey "^L" forward-char
#bindkey "^F" delete-char-or-list
#bindkey "^Z" clear-screen

setopt auto_pushd
setopt chase_links
setopt pushd_ignore_dups

setopt always_last_prompt
setopt complete_in_word
zstyle ':completion:*:default' menu select=2
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' '+m:{A-Z}={a-z}'
setopt menu_complete
setopt list_packed
setopt auto_menu
setopt auto_list
setopt list_types
setopt magic_equal_subst
zmodload zsh/complist
bindkey -M menuselect '^l' forward-char
bindkey -M menuselect '^b' backward-char
bindkey -M menuselect '^n' down-history
bindkey -M menuselect '^p' up-history
bindkey -M menuselect '^g' send-break
bindkey -M menuselect '^k' accept-and-infer-next-history
bindkey -M menuselect '.' vi-insert
bindkey -M menuselect '^r' history-incremental-search-backward
bindkey -M menuselect '^s' history-incremental-search-forward

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
      *~) ;; # ignore emacs backup files
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
alias emacs='LANG=C /Applications/Emacs.app/Contents/MacOS/Emacs'
alias zz=exit
alias ssh-agent-start='ssh-agent > ~/.ssh/agent; source ~/.ssh/agent; ssh-add'
alias ssh-agent-stop='eval `ssh-agent -k`; cp /dev/null ~/.ssh/agent'
alias ssh-agent-read='source ~/.ssh/agent; ssh-add -l'
function d () { colordiff -u $@ | diff-highlight | less -R; }
alias m=make
alias mg="make g "
alias w=make

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
om() { export om=$1; termtab $1 }
title() { export PROMPT=$PROMPT0; echo "\033]2;" $* "\007"}

[[ -d ~/.rbenv/bin ]] && export PATH="$HOME/.rbenv/bin:$PATH"

[ -f "$HOME/.zshrc_$uname" ] && source "$HOME/.zshrc_$uname"
[ -f "$HOME/.zshrc_local" ] && source "$HOME/.zshrc_local"

PATH="/Users/kaoru.maeda/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/kaoru.maeda/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/kaoru.maeda/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/kaoru.maeda/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/kaoru.maeda/perl5"; export PERL_MM_OPT;

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/maeda/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
