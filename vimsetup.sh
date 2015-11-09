#!/bin/bash
cp $HOME/github/config/.vimrc $HOME/.vimrc
mkdir -p $HOME/.vim/bundle && cd $HOME/.vim/bundle && git clone http://github.com/VundleVim/Vundle.vim && vim -c PluginInstall
sudo apt-get install python-dev libboost-python-dev
cd $HOME/.vim/bundle/YouCompleteMe/
python  install.py
vim
