#!/usr/bin/env zsh

set -e

echo "Installing Homebrew ..."
ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
brew update

echo "Installing GUI applications ..."
brew tap phinze/homebrew-cask
brew install brew-cask
apps=('google-chrome' 'google-drive' 'iterm2' 'dropbox' 'firefox' 'skype' 'spotify' \
      'virtualbox' 'github' 'flux' 'kindle' 'alfred' 'u-torrent' 'vagrant' 'unrarx' \
      'mplayerx' 'cheat-sheet' 'calibre' 'ichm' 'xunlei')
for app in $apps; do
  echo "Installing $app ..."
  brew cask install $app
done
brew cask alfred link
brew cask alfred status

echo "Installing tools and packages ..."
libs=('postgres' 'redis' 'vim' 'ctags' 'imagemagick' 'qt' 'openssl' 'wget' 'mysql' \
      'sqlite' 'nginx' 'node' 'youtube-dl')
for lib in $libs; do
  echo "Installing $lib ..."
  brew install $lib
done

echo "Installing zsh and oh-my-zsh ..."
brew install zsh
if [[ -f /etc/zshenv ]]; then
  sudo mv /etc/zshenv /etc/zprofile
fi
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

echo "Installing rbenv and ruby ..."
brew install rbenv
eval "$(rbenv init -)"
brew install rbenv-gem-rehash
brew install ruby-build
rbenv install 1.9.3-p327
rbenv install 2.0.0-p247
rbenv global 2.0.0-p247
rbenv rehash

gem update --system
gem install bundler pg rails unicorn pry --no-document
brew install heroku-toolbelt

cd $(dirname $0) && bundle && rake install
