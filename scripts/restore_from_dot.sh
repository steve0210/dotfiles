#!/bin/bash
############################
# restore_from_dot.sh
# This script restores dotfiles from the dotfile repo to the home directory 
############################

########## Variables

dir=$HOME/.dotfiles

##########

for store in $(find $dir -type f -name '*.dot')
do
  file="$HOME/.$(basename $store | cut -d . -f 1)"
  if [ -h "$file" ]; then
    echo "Restoring dot file $store to $file"
    rm $file
    cp $store $file
  else
    echo "File $file is not linked"
  fi
done

