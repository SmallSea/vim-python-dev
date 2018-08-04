#!/bin/sh

cp .screenrc ~
cp .vimrc ~

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qal
sudo apt-update
sudo apt-get -y install build-essential cmake
sudo apt-get -y install python-dev python3-dev

cd ~/.vim/bundle/YouCompleteMe
./install.py

echo "Change color schema to OneHalf Dark in iterms."
