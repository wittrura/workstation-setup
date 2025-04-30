#!/usr/bin/env bash
set -e
for git_tracked_filepath in ~/workspace/workstation-setup/dotfiles/*; do
  git_tracked_filename=$(basename ${git_tracked_filepath})
  home_dir_path=~/.${git_tracked_filename}

  # `git duet` alters the gitconfig, making a symlink less-than-ideal.  Copy the file instead.
  if [ ${git_tracked_filename} == "gitconfig" ]; then
    if [ -L "${home_dir_path}" ]; then
      rm ${home_dir_path}
    fi
    if [ -f "${home_dir_path}" ]; then
      echo "${home_dir_path} already exists and is not a symlink. Making a backup at ${home_dir_path}.bak and then replacing it with the dotfile from the dotfiles dir of this repo"
      mv ${home_dir_path} ${home_dir_path}.bak
    fi
    cp ${git_tracked_filepath} ${home_dir_path}
    continue
  fi

  if [ ! -L "${home_dir_path}" ]; then
    if [ -f "${home_dir_path}" ]; then
      echo "${home_dir_path} already exists and is not a symlink. Making a backup at ${home_dir_path}.bak and then replacing it with the dotfile from the dotfiles dir of this repo"
      mv ${home_dir_path} ${home_dir_path}.bak
    fi
    ln -s ${git_tracked_filepath} ${home_dir_path}
  fi
done
