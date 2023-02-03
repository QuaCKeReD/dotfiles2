#!/bin/bash

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# shell setup
if [ -f '/usr/local/bin/brew' ]; then 
	eval "$(/usr/local/bin/brew shellenv)"
fi

if [ -f '/opt/homebrew/bin/brew' ]; then 
	eval "$(/opt/homebrew/bin/brew shellenv)"
fi

export BREW_PREFIX=$(brew --prefix)
