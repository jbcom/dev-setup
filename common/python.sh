#!/usr/bin/env bash

brew install python
brew install python3

echo "------------------------------"
echo "Setting up pip."

# Install pip
easy_install pip

###############################################################################
# Virtual Enviroments                                                         #
###############################################################################

echo "------------------------------"
echo "Setting up virtual environments."

# Install virtual environments globally
# It fails to install virtualenv if PIP_REQUIRE_VIRTUALENV was true
export PIP_REQUIRE_VIRTUALENV=false
pip install virtualenv
pip install virtualenvwrapper

source ./loaders/virtualenv.sh

# Setup dev environments for py2 and py3
mkvirtualenv py2-dev
mkvirtualenv --python=/usr/local/bin/python3 py3-dev

