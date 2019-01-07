#!/bin/bash
############################
# restore_from_dot.sh
# This script restores dotfiles from the dotfile repo to the home directory 
############################

########## Variables

dir=$HOME/.dotfiles

##########

for file in $(find $HOME -maxdepth 1 ! -type d -name '.*rc')
do
  store=$dir/$(basename $file | cut -d . -f 2).dot
  if [ -f "$store" ]; then
    if [ -h "$file" ]; then
      echo "Restoring dot file $store to $file"
      rm $file
      cp $store $file
    else
      echo "File $file is not linked"
    fi
  else
    echo "File $store is not stored"
  fi
done

