#!/bin/bash
source ~/.bashrc_custom

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"
[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"
