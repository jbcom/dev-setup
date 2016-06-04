#!/usr/bin/env bash

mkdir -p /tmp/hashicorp
pushd /tmp/hashicorp
./bin/ask "Packer installation" && wget https://releases.hashicorp.com/packer/0.10.1/packer_0.10.1_darwin_amd64.zip
./bin/ask "Serf installation" && wget https://releases.hashicorp.com/serf/0.7.0/serf_0.7.0_darwin_amd64.zip
./bin/ask "Consul installation" && wget https://releases.hashicorp.com/consul/0.6.4/consul_0.6.4_darwin_amd64.zip
./bin/ask "Terraform installation" && wget https://releases.hashicorp.com/terraform/0.6.16/terraform_0.6.16_darwin_amd64.zip
./bin/ask "Vault installation" && wget https://releases.hashicorp.com/vault/0.5.3/vault_0.5.3_darwin_amd64.zip
./bin/ask "Nomad installation" && wget https://releases.hashicorp.com/nomad/0.3.2/nomad_0.3.2_darwin_amd64.zip
./bin/ask "Otto installation" && wget https://releases.hashicorp.com/otto/0.2.0/otto_0.2.0_darwin_amd64.zip

unzip *.zip -d /usr/local/
popd

rm -rf /tmp/hashicorp

pushd /tmp
wget https://releases.hashicorp.com/vagrant/1.8.3/vagrant_1.8.3.dmg
sudo hdiutil attach vagrant_1.8.3.dmg
sudo installer -package /Volumes/Vagrant/Vagrant.pkg -target /
sudo hdiutil detach /Volumes/Vagrant
rm -f vagrant_1.8.3.dmg
popd

if ./bin/ask "Vagrant installation"; then
	# Support Vum if it is installed with Pathogen
	source $HOME/.bash_profile
	git clone https://github.com/hashivim/vim-terraform.git
	if [ -d "$HOME/.vim_runtime/sources_non_forked" ]; then
		 RUNTIME_DIR=".vim_runtime/sources_non_forked/vim-terraform"
	elif [ -d "$HOME/.vim/bundle" ]; then
		RUNTIME_DIR=".vim/bundle"
	fi
fi