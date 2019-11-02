#!/bin/bash

cd ~/

echo "#"
echo "# Setup macOS..."
echo "#"

# # xcode-select
# echo "# * xcode-select"
# xcode-select --install

# sotrwareupdate
echo "# * softwareupdate"
softwareupdate -i -a

# github clone
echo "# * clone .dotfiles"
git clone https://github.com/nothink/dotfiles.git ~/.dotfiles
ln -sf .dotfiles/Brewfile .Brewfile

# homebrew
echo "# * homebrew"
if type "brew" > /dev/null; then
    echo "# * * homebrew exists. uninstalling... "
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall)"
fi
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew update
brew doctor
brew cleanup -s
brew missing
brew upgrade

# do brew bundle.
brew tap Homebrew/bundle
brew bundle --global

# restore rc files
rcup

# install pure-prompt
yarn global add pure-prompt
