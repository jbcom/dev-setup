#!/usr/bin/env bash

pushd /tmp
curl -O https://iterm2.com/downloads/beta/iTerm2-3_0_0.zip
unzip iTerm2-3_0_0.zip
rm -rf /Applications/iTerm.app
mv -fv iTerm.app /Applications/
rm -f iTerm2*.zip
popd

curl -L https://iterm2.com/misc/install_shell_integration.sh | bash
