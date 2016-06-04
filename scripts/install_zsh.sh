#!/usr/bin/env bash

if [ ! -f "$HOME/.zshrc" ]; then
	sh -c "$(\wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
	sudo dscl . -create /Users/$USER UserShell /usr/local/bin/zsh
fi