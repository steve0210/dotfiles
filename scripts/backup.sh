#!/bin/bash
############################
# backup.sh
# This script creates backs up dotfiles to ~/dotfiles
############################

########## Variables

subdir=.dotfiles
dir=$HOME/$subdir
dotfiles=(\( -name 'config' -o -name '.*rc' -o -name '.*config' -o -name '.*profile' -o -name '.*login' \)) 

##########

for file in $(find $HOME -maxdepth 2 ! -type d ${dotfiles[*]}  -not -path "${dir}*/*")
do
  store=$dir/$(echo $file | sed -e "s#$HOME/##").dot
  mkdir -p $(dirname $store)
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
