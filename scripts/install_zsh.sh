#!/usr/bin/env bash

# Load helpers function
source $(dirname "$0")/helpers.sh

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  info "Installing oh-my-zsh"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

if [ ! -f "$HOME/.oh-my-zsh/antigen.zsh" ]; then
  info "Installing antigen"
  curl -L git.io/antigen >"$HOME/.oh-my-zsh/antigen.zsh"
fi
