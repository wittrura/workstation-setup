#!/usr/bin/env bash

set -e

install_bash_it() {
  if [ -z "$BASH_IT" ] ; then
    echo "Installing bash_it"
    if [ ! -d ~/.bash_it ] ; then
      git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
    fi
    # Delete the alias "q=exit"
    if grep -q "alias q='exit'" ~/.bash_it/aliases/enabled/general.aliases.bash ; then
      sed -i -e '/alias q=.exit./d' ~/.bash_it/aliases/enabled/general.aliases.bash
    fi
    ~/.bash_it/install.sh --silent
  else
    set +e // Bash-it update errors when there is no update needed, so we turn off exit on error just for updating bash-it
    echo "bash_it already installed."
    source $BASH_IT/bash_it.sh
    echo "y" | bash-it update
    set -e
    echo "finished updating bash_it."
  fi
}

enable_standard_bash_it_plugins() {
  echo "Installing standard bash_it plugins"
  enable_bash_it_plugin history
  enable_bash_it_completion defaults
  enable_bash_it_completion git
  enable_bash_it_completion ssh
  enable_bash_it_alias bundler
  enable_bash_it_alias git
}

enable_customized_bash_it_plugins() {
  echo "installing custom bash_it plugins"
  for filepath in ~/workspace/workstation-setup/custom-bash-it-plugins/*; do
    enable_custom_bash_it_plugin $filepath
  done
}

echo
echo "Setting up bash profile with bash-it"
install_bash_it

source ./helpers/bash-it-helpers.sh

restore_default_bash_it_settings
enable_standard_bash_it_plugins
enable_customized_bash_it_plugins

