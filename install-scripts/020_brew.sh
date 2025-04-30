#!/usr/bin/env bash

# Depends on the Brewfile being a dotfile in home dir
set -e

install_brew() {
  if ! which brew > /dev/null ; then
    echo "Installing Homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi
}

brew_bundle() {
  set +e
  brew bundle check --global --verbose
  exit_code=$?
  set -e
  if [ $exit_code -ne 0 ]; then

    echo "Installing from the Brewfile..."
    brew update
    # brew tap Homebrew/bundle
    brew bundle --global || true # Ignore cask complaints about existing binaries. Note it will swallow real errors too
    brew bundle cleanup --force --global
  fi
}

install_brew
brew_bundle
