#!/bin/bash
############################
# backup.sh
# This script creates backs up dotfiles to ~/dotfiles
############################

########## Variables

dir=$HOME/.dotfiles

##########

for file in $(find $HOME -maxdepth 1 ! -type d -name '.*rc')
do
  store=$dir/$(basename $file | cut -d . -f 2).dot
  if [ -f "$store" ]; then
    echo "Replacing store $store"
    echo "rm $store"
  fi
  if [ ! -h "$file" ]; then
    echo "Backing up dot file $file to $store"
    echo "mv $file $store"
    echo "ln -s $store $file"
  else
    echo "File $file is already linked"
  fi
done
