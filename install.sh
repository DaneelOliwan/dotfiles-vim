#! /bin/bash

vimrc="$HOME/.vimrc"
vim="$HOME/.vim"
currentpath=$(pwd)

echo "vim installation..."
if [ -e $vimrc ] || [ -e $vim  ]
then
    echo ".vim or .vimrc file already exists"
else
    echo "linking .vimrc file..."
    cd $HOME
    ln -s $currentpath/.vim .vim
    ln -s $currentpath/.vimrc .vimrc
fi

if [ -d "$HOME/.vim-backup" ]
then
    mkdir "$HOME/.vim-backup"
fi
