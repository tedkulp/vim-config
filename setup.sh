#!/bin/sh

PWD=`pwd`

rm ~/.vim
ln -s $PWD/.vim ~/.vim
rm ~/.vimrc
ln -s $PWD/.vimrc ~/.vimrc
rm ~/.gvimrc
ln -s $PWD/.gvimrc ~/.gvimrc

if [ -d "$PWD/.vim/vundle.git" ]; then
  cd $PWD/.vim/vundle.git
  git pull origin master
  cd $PWD
  vim -c BundleInstall! -c qall > /dev/null 2>&1
else
  git clone http://github.com/gmarik/vundle.git $PWD/.vim/vundle.git
  vim -c BundleInstall -c qall > /dev/null 2>&1
fi
