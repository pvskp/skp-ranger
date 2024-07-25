#!/usr/bin/env bash
base_dir=$(dirname "$(realpath "$0")")

finished_with_errors=0

if [ -L "$HOME/.config/ranger" ]; then
 echo "Error: ~/.config/ranger/ symbolic link already exists. Delete it first."
 exit 1
fi

ln -s "$base_dir" "$HOME/.config/ranger"
if [ $? -ne 0 ]; then
  echo "Error: failed to export ~/.config/ranger/"
  finished_with_errors=1
fi

if [ $finished_with_errors -ne 0 ]; then
  echo "Warning: one or more failed to export"
else
  echo "Success: installed ranger config"
fi


