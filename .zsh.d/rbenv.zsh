if [ -d "$HOME/.rbenv/shims" ]; then
  export PATH=$HOME/.rbenv/shims:$PATH
  eval "$(rbenv init - zsh)"
elif [ -d "/usr/local/rbenv/shims" ]; then
  export PATH=/usr/local/rbenv/shims:$PATH
  eval "$(rbenv init - zsh)"
fi
