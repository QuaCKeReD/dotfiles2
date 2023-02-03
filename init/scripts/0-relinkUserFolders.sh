#!/usr/bin/env bash

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

########################################
# FOLDER RELINKS
########################################

# Common
./relinkFolder.sh ~/Downloads ~/Library/Mobile\ Documents/com~apple~CloudDocs/Downloads
./relinkFolder.sh ~/.ssh ~/config/.ssh/
./relinkFolder.sh ~/.config ~/config/.config/

# Applications
./relinkFolder.sh ~/.ansible ~/config/.ansible/
./relinkFolder.sh ~/.aws ~/config/.aws/
./relinkFolder.sh ~/.gitkraken ~/config/.gitkraken/
./relinkFolder.sh ~/.kube ~/config/.kube/

# Languages
./relinkFolder.sh ~/.cpan ~/config/.cpan/
./relinkFolder.sh ~/go ~/config/go/
./relinkFolder.sh ~/perl5 ~/config/perl5/

# AppD
./relinkFolder.sh ~/.appdynamics ~/config/.appdynamics/
./relinkFolder.sh ~/cstools ~/config/cstools/
