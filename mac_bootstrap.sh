#!/bin/bash

cd ~/

echo " ####################################### "
echo " #           Setup macOS....           # "
echo " ####################################### "

###############################################################################
# xcode-select
echo " ********************* xcode-select ********************* "
xcode-select --install

# sotrwareupdate
echo " ******************** softwareupdate ******************** "
softwareupdate -i -a

###############################################################################
# github clone
echo " ******************** clone .dotfiles ******************* "
git clone https://github.com/nothink/dotfiles.git ~/.dotfiles
ln -sf .dotfiles/Brewfile .Brewfile

# homebrew
echo " ******************** setup homebrew ******************** "
if type "brew" > /dev/null; then
    echo " # *** homebrew exists. uninstalling... *** # "
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"
fi
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo " ****************** updating homebrew ******************* "
brew update
brew doctor
brew cleanup -s
brew upgrade

# do brew bundle.
echo " ***************** restore brew bundles ***************** "
ln -sf ~/.dotfiles/Brewfile ~/.Brewfile
brew bundle --global

# restore rc files
echo " ******************* restore rc files ******************* "
rcup

# update fish settings
echo -e "\nsource "(brew --prefix asdf)"/libexec/asdf.fish" >> ~/.config/fish/config.fish

# install fisher and update
fish -c "curl -sL git.io/fisher | source && fisher update"

echo "# * Finished. *"
