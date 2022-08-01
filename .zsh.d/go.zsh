export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
if [ -x /opt/homebrew/bin/goenv ]; then
  eval "$(/opt/homebrew/bin/goenv init -)"
elif [ -x /usr/local/bin/goenv ]; then
  eval "$(/usr/local/bin/goenv init -)"
else
  export GO15VENDOREXPERIMENT=1
  export GOROOT=$(brew --prefix go)/libexec
  export GOPATH=$HOME/work
  export PATH=$PATH:$GOPATH/bin:$GOROOT/bin
fi
