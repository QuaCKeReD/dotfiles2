#!/usr/bin/env bash

#
# Install command-line tools using Homebrew.
#


# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Save our machines hostname
HOSTNAME=$(hostname)

########################################
# FORMULAE
########################################

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed #--with-default-names

# Install a modern version of Bash.
brew install bash
brew install bash-completion2
# Switch to using brew-installed bash as default shell
if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
  echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
  chsh -s "${BREW_PREFIX}/bin/bash";
fi;

# Install `wget` with IRI support.
brew install wget #--with-iri

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Install more recent versions of some macOS tools.
# brew install vim #--with-override-system-vi
brew install grep
brew install openssh
brew install screen
brew install php
brew install gmp

# Install other useful binaries.
brew install git
brew install git-lfs
brew install hping
brew install htop
# brew install imagemagick #--with-webp
brew install jq		    # grep for json
brew install openssl
brew install p7zip
brew install readline
brew install speedtest-cli
brew install ssh-copy-id
brew install tree
brew install webkit2png	# captures webpage screenshots

brew install fzf #https://github.com/junegunn/fzf

# Java
brew install java
sudo ln -sfn ${BREW_PREFIX}/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk

brew install jenv
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
# exec $SHELL -l

jenv add /Library/Java/JavaVirtualMachines/openjdk.jdk/Contents/Home

# brew tap AdoptOpenJDK/openjdk
# brew install adoptopenjdk8
# jenv add /Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home

jenv enable-plugin export
jenv enable-plugin gradle
jenv enable-plugin maven

jenv add `/usr/libexec/java_home`
jenv global system
jenv shell system
jenv versions
jenv doctor

# Others
brew install jandedobbeleer/oh-my-posh/oh-my-posh
brew install neofetch

########################################
# FORMULAE
# Per machine
########################################

if [ ${HOSTNAME%.*} == "bismuth" ]; then 

fi

if [ ${HOSTNAME%.*} == "polonium" ]; then 
  # Programming language
  brew install node

  brew tap homebrew/autoupdate
  brew autoupdate start --upgrade
fi

if [ ${HOSTNAME%.*} == "carbon" ]; then 
  # Programming language
  brew install node
  brew install go
  brew install lua

  brew link --overwrite perl

  # Python
  brew install python
  brew link --overwrite python
  #brew unlink python@3.9 && brew link python@3.9
  #ln -s /usr/local/bin/python3 /usr/local/bin/python

  sudo easy_install pip
  brew install pipenv
  #Install CSVKit and check to make sure that it is in your path
  pip install csvkit

  # Development
  brew install maven
  brew install gradle
  brew install ansible

  # for compare file
  brew install --cask diffmerge
  brew install duck  # https://duck.sh/

  # Cloud CLI
  brew install awscli

  # Kubernetes
  brew install kubernetes-cli
  brew link --overwrite kubernetes-cli

  brew install danielfoehrkn/switch/switch
  brew install k9s
  
  # Minikube - https://minikube.sigs.k8s.io/docs/start/
  brew install minikube
  # brew install docker-machine-driver-vmware
  # minikube config set driver docker
  # minikube config set cpus 2
  # minikube config set memory 1g
  # minikube config set disk-size 8000g
  # minikube start
  # minikube addons enable metrics-server
  # minikube addons enable ingress
  # minikube addons enable dashboard
  # minikube addons enable portainer

  # # Microk8s - https://microk8s.io/docs/install-macos
  brew install --cask multipass
  # brew install ubuntu/microk8s/microk8s
  # microk8s install --cpu 2 --mem 2 --disk 10 -y
  # microk8s status --wait-ready
  # microk8s enable dns 
  # microk8s enable metrics-server 
  # microk8s enable hostpath-storage 
  # microk8s enable rbac 
  # microk8s enable ingress
  # # microk8s enable portainer 
  # microk8s enable dashboard
  # microk8s kubectl apply -f ~/init/microk8s-dashboard-adminuser.yml
  # # Get admin-user token
  # microk8s_admin_user=$(microk8s kubectl -n kube-system get secret | grep admin-user-token | cut -d " " -f1)
  # microk8s_admin_user_token=microk8s kubectl -n kube-system describe secret $microk8s_admin_user_token | grep token: | cut -d " " -f7
  # # Get default token
  # microk8s_default=$(microk8s kubectl -n kube-system get secret | grep default-token | cut -d " " -f1)
  # microk8s_default_token=microk8s kubectl -n kube-system describe secret $microk8s_default_token | grep token: | cut -d " " -f7

  # AppD dashboarding
  brew install graphviz
fi

########################################
# CASKS
########################################

# Install font tools.
brew tap homebrew/cask-fonts
#brew install --cask font-source-code-pro
brew install --cask font-fontawesome
# brew install --cask font-inconsolata-dz-for-powerline
brew install --cask font-Inconsolata-nerd-font
#brew install --cask font-LiberationMono-nerd-font
brew install --cask font-Mononoki-nerd-font
#brew install --cask font-UbuntuMono-nerd-font
brew install --cask rocket
brew install --cask sf-symbols

# Essentials
brew install --cask 1password
brew install --cask 1password/tap/1password-cli
brew install --cask adguard
brew install --cask alfred
# brew link --cask alfred
brew install --cask resilio-sync
brew install --cask iterm2

# browser
brew install --cask choosy
brew install --cask google-chrome
#brew install --cask google-chrome-canary
#brew install --cask firefox
#brew install --cask firefox-beta
#brew install --cask safari-technology-preview
brew install --cask sessionrestore

# Networking
brew install --cask little-snitch
brew install --cask packet-peeper
brew install --cask screens-connect
brew install --cask tailscale

# File sharing
#brew install --cask dropbox
brew install --cask maestral # open source dropbox client
# brew install --cask cyberduck
# brew install --cask google-drive

# Tools
brew install --cask cakebrew #brew to install gui for brew :)
brew install --cask carbon-copy-cloner
brew install --cask karabiner-elements
brew install --cask keyboard-maestro
brew install --cask onyx
brew install --cask pdf-expert
brew install --cask qlmarkdown
brew install --cask resolutionator
brew install --cask timemachineeditor

brew install --cask setapp

########################################
# CASKS
# Per machine
########################################

if [ ${HOSTNAME%.*} == "polonium" ]; then 
  # open "/opt/homebrew/Caskroom/powerpanel/2.4.6/CyberPower PowerPanel Personal Installer.app"
fi

if [ ${HOSTNAME%.*} == "carbon" ]; then 
  
  # VM
  # brew install --cask virtualbox
  # brew install --cask docker-machine
  #brew install --cask vagrant
  #vagrant plugin install vagrant-vbguest

  # Tools
  # brew install --cask logitech-presentation # Needs manual install afterwards
  #open "/System/Volumes/Data/usr/local/Caskroom/logitech-presentation/*/LogiPresentation Installer.app"
fi

########################################
# Remove unrequired packages.
brew autoremove

# Remove outdated versions from the cellar.
brew cleanup
########################################
# EOF