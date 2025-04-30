#!/usr/bin/env bash

# Depends on the Brewfile being a dotfile in home dir
set -e

install_brew() {
  if ! which brew > /dev/null ; then
    echo "Installing Homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi
}

prep_dirs_for_brew() {
  # Make /usr/local/sbin for openvpn.
  # Check if it exists before creating (instead of using mkdir -p) to save the user having to enter
  # the sudo password when the mkdir -p will be a noop because it already exists.
  if [ ! -d /usr/local/sbin ]; then
    sudo mkdir /usr/local/sbin
    sudo chmod a+w /usr/local/sbin
  fi
}

brew_bundle() {
  set +e
  brew bundle check --global --verbose
  exit_code=$?
  set -e
  if [ $exit_code -ne 0 ]; then
    prep_dirs_for_brew

    echo "Installing from the Brewfile..."
    brew update
    # brew tap Homebrew/bundle
    brew bundle --global || true # Ignore cask complaints about existing binaries. Note it will swallow real errors too
    brew bundle cleanup --force --global
  fi
}

install_brew
brew_bundle
