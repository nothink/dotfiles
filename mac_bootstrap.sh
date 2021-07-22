#!/bin/bash

cd ~/

echo "#"
echo "# Setup macOS..."
echo "#"

###############################################################################
# os update
###############################################################################

# sotrwareupdate
echo "********** softwareupdate **********"
softwareupdate -i -a

###############################################################################
# setup from dotfiles
###############################################################################

# github clone
echo "********** clone .dotfiles **********"
git clone https://github.com/nothink/dotfiles.git ~/.dotfiles
ln -sf .dotfiles/Brewfile .Brewfile

# homebrew
echo "********** setup homebrew **********"
if type "brew" > /dev/null; then
    echo "# * * homebrew exists. uninstalling... "
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall)"
fi
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew update
brew doctor
brew cleanup -s
brew upgrade

# do brew bundle.
echo "********** restore brew bundles **********"
brew bundle install --global

# restore rc files
echo "********** restore rc files **********"
rcup

# install fisher and update
fish -c "curl -sL git.io/fisher | source && fisher update"
