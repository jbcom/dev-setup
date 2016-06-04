#!/usr/bin/env bash

brew install node
npm config set prefix /usr/local
command -v bower >/dev/null 2>&1 || npm install -g bower
