#!/usr/bin/env bash

rsync -avh loaders $HOME/
rsync -avh config $HOME/

# Ensure ONLY what is intended is symlinked!
declare -a config_files=('.editorconfig' '.bash_profile' '.bash_prompt' '.bashrc' '.curlrc' '.gitconfig.user' '.hushlogin' '.inputrc' '.mrjob.conf' '.s3cfg' '.screenrc' '.wgetrc')

pushd $HOME/config
    for config_file in "${config_files[@]}"; do
        mv $HOME/${config_file} $HOME/${config_file}.bak
        ln -s $HOME/config/${config_file} $HOME/${config_file}
    done
popd

declare -a install_scripts=('iterm2' 'ruby' 'vim' 'zsh')

for script_name in "${install_scripts[@]}"; do
	./bin/ask "${script_name} installation" && ./scripts/install_${script_name}.sh
done

declare -a config_scripts=('osx' 'git')

for config_name in "${config_scripts[@]}"; do
	./bin/ask "${config_name} configuration" && ./scripts/config_${config_name}.sh
done