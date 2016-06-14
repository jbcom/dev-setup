opinionated-dev-setup
============

This repository contains an opinionated dev-setup optimized using a global Makefile self-documented by running 'make'. It contains granular tasks that can bootstrap your shell, your OS, and install a variety of useful tooling centered around development and systems operations.

TASK                 | DESCRIPTION
-------------------- | ----------------------------------------------------------------------------------------------------
android-devel        | Install Android Studio for Android Development
android              | Install the Android SDK
aws                  | Install the AWS CLI and configure your local environment.
bootstrap            | Bootstraps your Git confiugration with your user information.
clean-home           | Clean home directory of old configuration.
clean-homebrew       | Cleanup after Homebrew.
core-extras          | Install extra utilities for the OSX terminal.
core                 | Install core utilities for a better terminal experience.
data-big             | Install Apache Spark for big data.
data-extras          | Install extra databases for development against.
data-sql             | Install standard SQL databases.
docker               | Install the Docker toolbox to work with containers.
fonts                | Install font tools for OSX.
google-cloud         | Install the Google Cloud SDK and initialize the gcloud tool to work with the Google Platform.
gui-browsers         | Install GUI web-browsers to connect to the Internet on OSX.
gui-core             | Install core GUI tools for OSX.
gui-editors          | Install GUI editor tools for OSX.
gui-extras           | Install extra GUI tools for OSX.
gui-quick-look       | Install quick-look tools for OSX.
hashicorp            | Install Hashicorp tools for OSX
help                 | Displays help for all targets
heroku               | Installs and updates the Heroku toolbox, and logs you in.
homebrew-upgrade     | Upgrades Homebrew.
homebrew             | Installs Homebrew.
java-devel           | Installs Intellij IDE for OSX.
java-libs            | Installs libraries for Java.
java                 | Installs Java for OSX.
node-libs            | Installs libraries for Node.
node                 | Installs Node, NPM, and Bower for OSX.
osx-config           | Configures OSX with developer-optiumized settings.
osx-install          | Updates OSX and installs xcode libraries necessary for Homebrew.
php                  | Installs PHP 5.5 for OSX.
python-devel         | Installs development tools for Python.
python               | Installs Python 2 and 3 as well as Pip.
security             | Installs security tools for OSX.
sql-extras           | Installs MySQL workbench for managing MySQL on OSX.
sudo                 | Requests sudo privileges.
uninstall            | Uninstalls Homebrew from OSX.

### Credits

See the [Credits Page](https://github.com/jbcom/opionated-dev-setup/blob/master/CREDITS.md).

### License

This repository is originally a fork of dev-setup developed by Donne Martin, with additional code from third-parties.  The third-party content is distributed under the license provided by those parties. An attempt has been made at all times to offer credit to the correct sources.

The content developed by Donne Martin is distributed under the following license:

    Copyright 2015 Donne Martin

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
