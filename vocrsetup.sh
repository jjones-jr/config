#!/bin/bash

mkdir $HOME/vocr && mkfifo $HOME/vocr/output.txt
xbindkeys xbindkeys-config
