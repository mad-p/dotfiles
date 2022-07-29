#!/usr/bin/env bash

#BREWFILE_IGNORE
if ! which brew >& /dev/null;then
  brew_installed=0
  echo Homebrew is not installed!
  echo Install now...
  echo /bin/bash -c \"\$\(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh\)\"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  if [ -x /opt/homebrew/bin/brew ]; then
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
  elif [ -x /usr/local/bin/brew ]; then
    echo 'eval "$(/usr/local/bin/brew shellenv)"' >> $HOME/.zprofile
    eval "$(/usr/local/bin/brew shellenv)"
  fi
  echo
fi
#BREWFILE_ENDIGNORE

brew bundle
