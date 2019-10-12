#!/bin/sh

echo "#"
echo "# Setup macOS..."
echo "#"

# sotrwareupdate
echo "# * softwareupdate"
softwareupdate -i -a

# xcode-select
echo "# * xcode-select"
xcode-select --install

# homebrew
echo "# * homebrew"
/usr/bin/ruby -e \
    "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
brew doctor
