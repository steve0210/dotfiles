#!/bin/bash
############################
# backup.sh
# This script creates backs up dotfiles to ~/dotfiles
############################

########## Variables

dir=$HOME/.dotfiles
dotfiles=(\( -name '.*rc' -o -name '.*config' \)) 

##########

for file in $(find $HOME -maxdepth 1 ! -type d ${dotfiles[*]})
do
  store=$dir/$(basename $file | cut -d . -f 2).dot
  if [ ! -h "$file" ]; then
    echo "Backing up dot file $file to $store"
    if [ -f "$store" ]; then
      echo "Replacing store $store"
      rm $store
    fi
    mv $file $store
    ln -s $store $file
  else
    echo "File $file is already linked"
  fi
done
