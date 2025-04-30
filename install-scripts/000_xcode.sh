#!/bin/bash

set -e

# Install x-code and accept license manually
# We basically do this solely to get git
install_xcode() {
	if [[ -z $(xcode-select -p) ]]; then
	  echo "Installing XCode developer tools"
	  sudo xcodebuild -license
	  xcode-select --install
	else
	  echo "XCode detected, skipping install"
		echo
	fi
}

install_xcode
