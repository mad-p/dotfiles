#!/bin/sh

# stolen from github.com/sonots/.dotfiles

[ -e ~/dotfiles ] || git clone git@github.com:mad-p/dotfiles.git ~/dotfiles
cd ~/dotfiles

git submodule init
git submodule update

for i in `ls -a`; do
  [ $i = "." ] && continue
  [ $i = ".." ] && continue
  [ $i = ".git" ] && continue
  [ $i = "README.md" ] && continue
  [ $i = "install.sh" ] && continue
  [ $i = "bin" ] && continue
  ln -s dotfiles/$i ~/
done
[ -d ~/bin ] || mkdir ~/bin
for i in bin/*; do
  ln -s ../dotfiles/$i ~/bin/
done

if [ `uname` = "Darwin" ]; then
  brew bundle
  brew tap sanemat/font
  brew install ricty
  cp -f /usr/local/Cellar/ricty/*/share/fonts/Ricty*.ttf ~/Library/Fonts/
  fc-cache -vf
fi

# vim -c ':NeoBundleInstall!' -c ':q!' -c ':q!'

exit 0
