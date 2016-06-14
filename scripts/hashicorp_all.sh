#!/usr/bin/env bash

mkdir -p /tmp/hashicorp

declare -A tools
tools[packer]='0.10.1'
tools[serf]='0.7.0'
tools[consul]='0.6.4'
tools[terraform]='0.6.16'
tools[vault]='0.5.3'
tools[nomad]='0.3.2'
tools[otto]='0.2.0'

for tool in "${!tools[@]}"; do
	./scripts/ask.sh "${tool} installation" || continue
	
	version="${tools[$tool]}"

	curl -o /tmp/hashicorp/${tool}.zip https://releases.hashicorp.com/${tool}/${version}/${tool}_${version}_darwin_amd64.zip
	unzip /tmp/hashicorp/${tool}.zip -d /usr/local/
done

vagrant_version='1.8.3'

curl -o /tmp/hashicorp/vagrant.dmg https://releases.hashicorp.com/vagrant/${vagrant_version}/vagrant_${vagrant_version}.dmg
sudo hdiutil attach /tmp/hashicorp/vagrant.dmg
sudo installer -package /Volumes/Vagrant/Vagrant.pkg -target /
sudo hdiutil detach /Volumes/Vagrant
rm -f /tmp/hashicorp/vagrant_${vagrant_version}.dmg

rm -rf /tmp/hashicorp

# Support Vum if it is installed with Pathogen
source $HOME/.bash_profile
git clone https://github.com/hashivim/vim-terraform.git
if [ -d "$HOME/.vim_runtime/sources_non_forked" ]; then
	 RUNTIME_DIR=".vim_runtime/sources_non_forked/vim-terraform"
elif [ -d "$HOME/.vim/bundle" ]; then
	RUNTIME_DIR=".vim/bundle"
fi