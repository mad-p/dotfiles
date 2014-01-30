_set_env_git_current_branch() {
  GIT_CURRENT_BRANCH=$( basename "`git symbolic-ref HEAD 2> /dev/null`" )
}

_update_rprompt () {
  if [ "`git ls-files 2>/dev/null`" ]; then
    RPROMPT="[%(5~,%-2~/../%2~,%~):$GIT_CURRENT_BRANCH]"
  else
    RPROMPT="[%(5~,%-2~/../%2~,%~)]"
  fi
}

precmd()
{
  _set_env_git_current_branch
  _update_rprompt
}

chpwd()
{
  _set_env_git_current_branch
  _update_rprompt
}

#compdef git-br git-co
x=( /usr/share/zsh/**/_git )
if [ -f "$x" ]; then
  source $x
fi
unset x

_git-br () {
  _git-branch
}
_git-co () {
  _git-checkout
}

source ~/.zsh.d/git-escape-magic
git-escape-magic
