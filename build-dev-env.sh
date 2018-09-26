#!/bin/bash

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    *)          machine="UNKNOWN:${unameOut}"
esac

if [ ${machine} = "UNKNOWN:${unameOut}" ]; then
    echo "This script only supported Ubuntu/Debuan and MacOS."
    echo "Your OS is ${machine} and not in suppot list."
    exit 127
fi

echo "Your platform is: ${machine}, starting to install:"

cp .screenrc ~
cp .vimrc ~

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qal

if [ ${machine} = "Linux"]; then
    sudo apt-update
    sudo apt-get -y install build-essential cmake
    sudo apt-get -y install python-dev python3-dev
elif [ ${machine} = "Mac" ]; then
    brew install python3 cmake
fi

cd ~/.vim/bundle/YouCompleteMe
./install.py

echo "Change color schema to OneHalf Dark in iterms."
