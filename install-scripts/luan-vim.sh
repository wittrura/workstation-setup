#!/usr/bin/env bash

# The developer of luan/vimfiles has created a newer repository and moved all new development to https://github.com/luan/nvim

set -ex

[ -d ~/.vim ] && rm -rf ~/.vim
[ -d ~/.config/nvim ] && rm -rf ~/.config/nvim

pushd ~/workspace/
  set +e
  git clone https://github.com/luan/nvim ~/.config/nvim
  set -e
popd
