#!/bin/bash
############################
# install.sh
# This script creates symlinks from the home directory to dotfiles in ~/.dotfiles
############################

########## Variables

subdir=.dotfiles
dir=$HOME/$subdir
dir_bk=$HOME/${subdir}_bk

##########

for store in $(find $dir -type f -name '*.dot')
do
  file=$(echo $store | sed -e "s#/$subdir##" -e 's#.dot$##')
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

