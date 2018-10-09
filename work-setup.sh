#!/bin/bash

install_brew() {
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
}

setup_brew() {
	common_tools=(\
		git \
		bash-completion \
		stow \
	)

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
   install_brew
fi
if ! command -v stow > /dev/null 2>&1
then
   setup_brew
fi
setup_stow

# Source bashrc_custom in profile
echo '. "$HOME/.bashrc_custom"' >> ~/.bash_profile

# Unset git osxkeychain credential helper
git config --system --unset credential.helper
