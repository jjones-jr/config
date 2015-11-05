#!/bin/bash
mkdir -p $HOME/.vim/bundle && cd $HOME/.vim/bundle && git clone http://github.com/VundleVim/Vundle.vim && vim -c PluginInstall
