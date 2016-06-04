#!/usr/bin/env bash

# First kill the symlinks, they don't need to be backed up
pushd $HOME
find . -name ".[^.]*" -maxdepth 1 -type l -exec rm -f {} \;
mkdir -p Backups
mv .[^.]* Backups/
popd
