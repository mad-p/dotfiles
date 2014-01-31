if [ -d "$HOME/.rbenv/shims" ]; then
  export PATH=$HOME/.rbenv/shims:$PATH
  eval "$(rbenv init - zsh)"
fi
