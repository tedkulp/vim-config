#!/bin/sh

PWD=`pwd`

ln -ivs $PWD/.vim ~/.vim
ln -ivs $PWD/.vimrc ~/.vimrc
ln -ivs $PWD/.gvimrc ~/.gvimrc

if [ -d "$PWD/.vim/vundle.git" ]; then
  cd $PWD/.vim/vundle.git
  git pull origin master
  cd $PWD
  vim +BundleInstall! +qa
else
  git clone http://github.com/gmarik/vundle.git $PWD/.vim/vundle.git
  vim +BundleInstall +qa
fi
