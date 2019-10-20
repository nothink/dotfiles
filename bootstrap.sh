#!/bin/bash

cd ~/

echo "#"
echo "# Setup macOS..."
echo "#"

# sotrwareupdate
echo "# * softwareupdate"
softwareupdate -i -a

# xcode-select
echo "# * xcode-select"
xcode-select --install

# github clone
echo "# * clone .dotfiles"
git clone git@github.com:nothink/dotfiles.git ~/.dotfiles
ln -sf .dotfiles/Brewfile .Brewfile

# homebrew
echo "# * homebrew"
if ! type "brew" > /dev/null; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    echo "# * * homebrew exists. continue... "
fi
brew update
brew doctor
brew tap Homebrew/bundle
brew bundle --global

# restore rc files
rcup

# install pure-prompt
yarn install pure-prompt
