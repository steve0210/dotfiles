#!/bin/bash
############################
# install.sh
# This script creates symlinks from the home directory to dotfiles in ~/.dotfiles
############################

########## Variables

dir=$HOME/.dotfiles
dir_bk=$HOME/.dotfiles_bk

##########

for store in $(find $dir -type f -name '*.dot')
do
  file="$HOME/.$(basename $store | cut -d . -f 1)"
  if [ -f "$file" ]; then
    file_bk="$dir_bk/$(basename $file)"
    echo "Backing up dot file $file to $file_bk"
    mkdir -p $dir_bk
    if [ -f "$file_bk" ]; then 
      rm $file_bk
    fi
    mv $file $file_bk
  fi
  echo "Creating symlink to $store at $file"
  ln -s $store $file
done

