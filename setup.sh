#!/bin/sh

PWD=`pwd`

rm ~/.vim
ln -s $PWD/.vim ~/.vim
rm ~/.vimrc
ln -s $PWD/.vimrc ~/.vimrc
rm ~/.gvimrc
ln -s $PWD/.gvimrc ~/.gvimrc

mkdir -p $PWD/.vim/bundle

if [ -d "$PWD/.vim/bundle/neobundle.vim" ]; then
  cd $PWD/.vim/bundle/neobundle.vim
  git pull origin master
  cd $PWD
  vim -c NeoBundleInstall! -c qall > /dev/null 2>&1
else
  git clone https://github.com/Shougo/neobundle.vim.git $PWD/.vim/bundle/neobundle.vim
  vim -c NeoBundleInstall -c qall > /dev/null 2>&1
fi
