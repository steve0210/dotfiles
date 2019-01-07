#!/bin/bash
############################
# restore_from_bk.sh
# This script restores dotfiles from the backup directory to the home directory
############################

########## Variables

dir_bk=$HOME/.dotfiles_bk

##########

for store in $(find $dir_bk -type f -name '.*')
do
  file=$HOME/$(basename $store)
  if [ -h "$file" ]; then
    echo "Restoring dot file $store to $file"
    rm $file
    cp $store $file
  else
    echo "File $file is not linked"
  fi
done

