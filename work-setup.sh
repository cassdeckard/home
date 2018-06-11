#!/bin/bash

setup_brew() {
	common_tools=(\
		git \
		bash-completion \
		stow \
	)

	# Install Homebrew
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

	# Install Common Tools
	brew install ${common_tools[*]}
}

setup_stow() {
	stow_items=(\
		bash \
		git \
		scripts \
		vim \
	)

	stow --verbose ${stow_items[*]}
}

if ! command -v brew > /dev/null 2>&1
then
   setup_brew
fi
setup_stow

# Source bashrc_custom in profile
echo '. "$HOME/.bashrc_custom"' >> ~/.bash_profile
