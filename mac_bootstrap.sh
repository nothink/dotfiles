#!/bin/bash

cd ~/

echo "#"
echo "# Setup macOS..."
echo "#"

# xcode-select
echo "# * xcode-select"
xcode-select --install

# sotrwareupdate
echo "# * softwareupdate"
softwareupdate -i -a

# github clone
echo "# * clone .dotfiles"
git clone https://github.com/nothink-sbinc/dotfiles.git ~/.dotfiles

# homebrew
echo "# * homebrew"
if type "brew" > /dev/null; then
    echo "# * * homebrew exists. uninstalling... "
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall)"
fi
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "# * * updating homebrew..."
brew update
brew doctor
brew cleanup -s
brew missing
brew upgrade

# do brew bundle.
echo "# * * updating homebrew bundles..."
ln -sf ~/.dotfiles/Brewfile ~/.Brewfile
brew tap Homebrew/bundle
brew bundle --global

# restore rc files
echo "# * restore rc files"
rcup

echo "# * Finished. *"
