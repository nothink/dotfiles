#!/bin/bash

cd ~/

echo "#"
echo "# Setup macOS..."
echo "#"

###############################################################################
# base update
###############################################################################

# # xcode-select
# echo "********** xcode-select **********"
# xcode-select --install

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

###############################################################################
# restore another
###############################################################################

# install pure-prompt
echo "********** install pure-prompt **********"
yarn global add pure-prompt

# install from App Store

mas isntall 497799835       # Xcode
mas install 1024640650      # CotEditor
mas install 445189367       # PopClip
mas install 692867256       # Simplenote
mas install 1206246482      # EdgeView 2
mas install 1333542190      # 1Password 7
mas install 1176895641      # Spark
mas install 1464122853      # NextDNS
mas install 966085870       # TickTick
