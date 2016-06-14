#!/usr/bin/env bash

backups_dir="$HOME/Backups"
mkdir -p $backups_dir

./scripts/ask.sh "$HOME symlink deletion" && find $HOME -name ".[^.]*" -maxdepth 1 -type l -exec rm -f {} \;

for file in $HOME/.[^.]*; do
	OVERRIDE_PROMPT=1 ./scripts/ask.sh "Move $file to $backups_dir?" && mv -f $file $backups_dir/
done