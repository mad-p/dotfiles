if [ -d "/usr/local/rbenv/shims" ]; then
  export PATH=/usr/local/rbenv/bin:/usr/local/rbenv/shims:$PATH
fi
if [ -d "$HOME/.rbenv/shims" ]; then
  export PATH=$HOME/.rbenv/shims:$PATH
fi
if [ -x "`which rbenv 2>/dev/null`" ]; then
  eval "$(rbenv init - zsh)"
fi
