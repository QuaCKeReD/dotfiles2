#!/bin/bash

# https://github.com/Homebrew/homebrew/issues/23500

xcode-select --install

xcode-select -switch /

if [ ${HOSTNAME%.*} == "polonium" ]; then 
  # Rosetta, for Apple Silicon
  sudo softwareupdate --install-rosetta
fi

# Possible extra
# xcode-select -switch /Library/Developer/CommandLineTools/
# chown -R $(whoami):admin /usr/local
