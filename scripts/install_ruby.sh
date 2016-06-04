#!/usr/bin/env bash

source ~/.bash_profile

if [ -d "$HOME/.rvm" ]; then
	rvm get head
else
	gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
	@\curl -sSL https://get.rvm.io | bash -s stable --ruby ||:
fi