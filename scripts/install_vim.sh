#!/usr/bin/env bash

if [ ! -f "$HOME/.vimrc" ]; then
	git clone https://github.com/amix/vimrc.git ~/.vim_runtime
	sh ~/.vim_runtime/install_awesome_vimrc.sh
fi