# Core Services Wiki
https://github.com/pivotal-cf/workstation-setup/wiki

# Workstation Setup
The standard workstation setup can be installed by running ./install.

## Installation:
Clone the [core services wiki](https://github.com/pivotal-cf/workstation-setup/wiki) into a subdirectory `workspace` of your home directory. Then run ./install from that workstation-setup repo.

Or, if you want to run just a portion of the setup, you can run individual scripts from the install-scripts dir. However, there are some dependencies among them which are not always explicit.

## Warning:
This tool was built to set up a clean laptop or workstation in a consistent manner. It is not so concerned with preserving your existing tooling.

Running install will overwrite parts of your existing config, such as your Brewfile, your dotfiles (though backups will be created) and your bash and vim config.

## Dependencies:
Mac OSX Sierra

## Goals:

* Does not require human intervention to run, so that it can be run weekly or nightly
* Make it easy to spin up a new machine with familiar tools
* Idempotent
* Lightweight
* Easy to update

## Tools:
* https://github.com/luan/vimfiles for our vimconfig
* https://github.com/Bash-it/bash-it for bash configuration

## Not yet installed:
Docker is not part of the install script, but you may want to install it manually. (It's very difficult to programatically install without user input)

