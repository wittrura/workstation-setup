#!/usr/bin/env bash

# The developer of luan/vimfiles has created a newer repository and moved all new development to https://github.com/luan/nvim

set -ex

[ -d ~/.vim ] && rm -rf ~/.vim
[ -d ~/.config/nvim ] && rm -rf ~/.config/nvim

pushd ~/workspace/
  set +e
  git clone https://github.com/luan/nvim ~/.config/nvim
  set -e

  # Dependencies for NeoVim and the Deoplete plugin
  # Sometimes NeoVim complains about the Python provider. Running this usually
  # fixes it. These commands come from NeoVim's :checkhealth command.
  pip3 uninstall -y pynvim neovim
  pip3 install pynvim
  pip3 install neovim
popd
