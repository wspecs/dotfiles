#!/bin/bash

cd ~

cp ~/dotfiles/vim/.vimrc ~/.vimrc
echo "Replaced vimrc"

cp ~/dotfiles/zsh/.zshrc ~/.zshrc
echo "Replaced vimrc"

rm -rf ~/dotfiles
echo "Done"
