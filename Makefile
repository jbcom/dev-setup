SHELL := /usr/bin/env bash
.DEFAULT_GOAL := help
.PHONY : android android-devel aws bootstrap core core-extras clean-homebrew clean-home data-big data-extras data-sql docker fonts google-cloud gui-browsers gui-core gui-terminal gui-editors gui-extras gui-quick-look hashicorp help homebrew homebrew-upgrade heroku java java-libs java-devel node node-libs osx-install osx-install-recommended osx-config php python python-devel sudo uninstall

android: homebrew ## Install the Android SDK
	brew install android-sdk

android-devel: android ## Install Android Studio for Android Development
	brew cask install android-studio

aws: homebrew ## Install the AWS CLI and configure your local environment.
	brew install awscli
	@./scripts/ask.sh "AWS configuration" && aws --configure ||:

bootstrap: core ## Bootstraps your Git confiugration with your user information.
	@./scripts/ask.sh "OSX shell bootstrap" && ./scripts/bootstrap.sh ||:

core: homebrew ## Install core utilities for a better terminal experience.
	brew install coreutils
	@sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum ||:
	brew install moreutils
	brew install findutils
	brew install gnu-sed --with-default-names
	brew install bash
	brew install bash-completion2
	brew install zsh
	brew install zsh-autosuggestions
	brew install zsh-completions
	brew install wget --with-iri
	brew install curl
	brew install gpg
	brew install remake
	brew install homebrew/dupes/grep
	brew install homebrew/dupes/openssh
	brew install homebrew/dupes/screen
	brew install libxml2
	brew install libxslt
	brew link libxml2 --force
	brew link libxslt --force
	brew install ssh-copy-id
	brew install imagemagick --with-webp
	brew install lua
	brew install lynx
	brew install p7zip
	brew install pkg-config
	brew install libffi
	brew install tree
	brew install rename

core-extras: core ## Install extra utilities for the OSX terminal.
	brew install ack
	brew install dark-mode
	brew install pigz
	brew install pv
	brew install rhino
	brew install speedtest_cli
	brew install webkit2png
	brew install zopfli
	brew install pandoc
	brew install xpdf

clean-homebrew: ## Cleanup after Homebrew.
	brew cleanup

clean-home: ## Clean home directory of old configuration.
	@./scripts/ask.sh "Home directory cleanup" && ./scripts/clean.sh ||:

data-big: homebrew ## Install Apache Spark for big data.
	brew install apache-spark

data-extras: homebrew ## Install extra databases for development against.
	brew install mongo
	brew install redis
	brew install elasticsearch

data-sql: homebrew ## Install standard SQL databases.
	brew install mysql
	brew install postgresql

docker: homebrew ## Install the Docker toolbox to work with containers.
	brew cask install dockertoolbox

fonts: homebrew ## Install font tools for OSX.
	brew tap bramstein/webfonttools
	brew install sfnt2woff
	brew install sfnt2woff-zopfli
	brew install woff2

google-cloud: homebrew ## Install the Google Cloud SDK and initialize the gcloud tool to work with the Google Platform.
	brew cask install google-cloud-sdk
	@./scripts/ask.sh "Google Cloud initialization" && gcloud init ||:

gui-browsers: homebrew ## Install GUI web-browsers to connect to the Internet on OSX.
	brew cask install google-chrome
	brew cask install firefox

gui-core: homebrew ## Install core GUI tools for OSX.
	brew cask install xquartz
	brew cask install alfred

gui-terminal:
	# Installing iterm2 through Homebrew is at the moment broken when you auto-update
	@./scripts/ask.sh "iTerm installer" && ./scripts/install_iterm2.sh ||:

gui-editors: homebrew ## Install GUI editor tools for OSX.
	brew install macvim --custom-icons --with-override-system-vim --with-lua --with-luajit
	brew linkapps macvim
	brew cask install sublime-text3
	brew cask install atom

gui-extras: homebrew ## Install extra GUI tools for OSX.
	brew cask install macdown
	brew cask install skype
	brew cask install slack
	brew cask install dropbox
	brew cask install evernote
	brew cask install gimp
	brew cask install inkscape

gui-quick-look: homebrew ## Install quick-look tools for OSX.
	brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql qlimagesize webpquicklook suspicious-package

hashicorp: sudo ## Install Hashicorp tools for OSX
	@./scripts/ask.sh "Hashicorp install" && ./scripts/hashicorp_all.sh ||:
	
help: ## Displays help for all targets
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | sed 's/##/:/g' | ./scripts/help.sh

heroku: homebrew ## Installs and updates the Heroku toolbox, and logs you in.
	brew install heroku-toolbelt
	heroku update
	@./scripts/ask.sh "Heroku login" && heroku login ||:

homebrew: sudo ## Installs Homebrew.
	@./scripts/ask.sh "Homebrew install" && ./scripts/homebrew_all.sh ||:

homebrew-upgrade: homebrew ## Upgrades Homebrew.
	brew upgrade --all

java: homebrew ## Installs Java for OSX. 
	brew cask install java

java-libs: java ## Installs libraries for Java.
	brew install ringojs
	brew install narwhal
	brew install bfg

java-devel: java ## Installs Intellij IDE for OSX.
	brew cask install intellij-idea-ce

node: homebrew ## Installs Node, NPM, and Bower for OSX.
	brew install node
	npm config set prefix /usr/local
	command -v bower >/dev/null 2>&1 || npm install -g bower

node-libs: node ## Installs libraries for Node.
	npm install -g coffee-script
	npm install -g grunt-cli
	npm install -g jshint
	npm install -g less

osx-install: sudo ## Updates OSX and installs xcode libraries necessary for Homebrew.
	sudo softwareupdate -iva
	xcode-select --install

osx-config: osx-install ## Configures OSX with developer-optiumized settings.
	@./scripts/ask.sh "Developer-Optimized OSX Defaults" && ./scripts/config.sh ||:

php: homebrew ## Installs PHP 5.5 for OSX.
	brew install homebrew/php/php55 --with-gmp

python: homebrew ## Installs Python 2 and 3 as well as Pip.
	brew install python
	brew install python3
	easy_install pip

python-devel: python ## Installs development tools for Python.
	pip install virtualenv
	pip install virtualenvwrapper
	pip install ipython
	pip install tornado 
	brew install zeromq --universal
	pip install pyzmq
	pip install pygments
	brew install freetype libpng pyqt
	pip install numpy
	pip install scipy
	pip install matplotlib
	pip install jinja2

sql-extras: homebrew ## Installs MySQL workbench for managing MySQL on OSX.
	brew cask install mysqlworkbench

security: homebrew ## Installs security tools for OSX.
	brew install aircrack-ng
	brew install binutils
	brew install binwalk
	brew install cifer
	brew install dex2jar
	brew install dns2tcp
	brew install fcrackzip
	brew install foremost
	brew install hashpump
	brew install hydra
	brew install john
	brew install knock
	brew install netpbm
	brew install nmap
	brew install pngcheck
	brew install socat
	brew install sqlmap
	brew install tcpflow
	brew install tcpreplay
	brew install tcptrace
	brew install ucspi-tcp # `tcpserver` etc.
	brew install xz

sudo: ## Requests sudo privileges.
	@sudo -v ||:

uninstall: homebrew ## Uninstalls Homebrew from OSX.
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall)"
