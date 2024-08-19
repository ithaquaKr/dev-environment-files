#!/usr/bin/env bash

# Load helpers function
source $(dirname "$0")/helpers.sh

# Variables
DOTFILES=$1

# This script use to install homebrew
if ! which brew >/dev/null; then
  info "Installing Homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  success "Complete."
else
  info "Updating homebrew"
  brew update
  brew upgrade
  success "Complete."
fi

info "Installing homebrew packages"
brew bundle --file "$DOTFILES/brew/Brewfile"
success "Complete."
