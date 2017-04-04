#!/usr/bin/env bash

#BREWFILE_IGNORE
if ! which brew >& /dev/null;then
  brew_installed=0
  echo Homebrew is not installed!
  echo Install now...
  echo ruby -e \"\$\(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install\)\"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  echo
fi
#BREWFILE_ENDIGNORE

# tap repositories and their packages

# brew tap caskroom/cask
brew install brew-cask
brew cask install bettertouchtool
# brew cask install dropbox
brew cask install emacs
# brew cask install gimp
# brew cask install google-chrome
# brew cask install nosleep
# brew cask install skype
# brew cask install vagrant
# brew cask install virtualbox
brew cask install xquartz

brew tap homebrew/x11
brew install xdu

brew tap rcmdnk/file
brew install brew-file

# Other Homebrew packages
brew install ack
brew install aspell
brew install autoconf
brew install automake
brew install bdw-gc
brew install bsdmake
# brew install cairo
# brew install cmake
brew install colordiff
brew install ctags
# brew install czmq
# brew install d-bus
brew install dict
brew install emacs --with-x --with-imagemagick
# brew install exiv2
# brew install ffmpeg
# brew install fontconfig
# brew install fontforge
# brew install freetype
brew install gdbm
# brew install geoip
brew install gettext
brew install gist
brew install git
brew install glib
brew install gmp
brew install gnu-tar
brew install gnutls
brew install gobject-introspection
brew install harfbuzz
# brew install icu4c
brew install imagemagick
brew install jpeg
# brew install lame
# brew install libao
# brew install libffi
# brew install libgcrypt
# brew install libgpg-error
# brew install libmaa
# brew install libogg
brew install libpng
# brew install libsodium
# brew install libtasn1
# brew install libtiff
brew install libtool
# brew install libvo-aacenc
# brew install libvorbis
# brew install mercurial
# brew install mysql
# brew install nettle
# brew install node
brew install openssl
# brew install ossp-uuid
# brew install p11-kit
# brew install pango
brew install pcre
brew install pixman
brew install pkg-config
brew install pngcheck
brew install proctools
brew install python
brew install rbenv
brew install readline
brew install ruby-build
# brew install scala
# brew install sqlite
brew install tig
brew install tree
# brew install vorbis-tools
brew install w3m
brew install wget
# brew install wireshark
# brew install x11vnc
# brew install x264
# brew install xvid
brew install xz
# brew install zeromq
brew install zsh

# Below applications were installed by Cask,
# but do not have corresponding casks.

#brew cask install intellij-idea-community (!)
brew cask install right-owl

# App Store applications
#appstore Dash
#appstore Growl
#appstore Keynote
#appstore Microsoft Remote Desktop
#appstore Numbers
#appstore Pages
#appstore SkyDrive
#appstore Slack
#appstore Telegram Desktop
#appstore Telegram
#appstore Xcode
