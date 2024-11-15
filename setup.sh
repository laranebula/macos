#!/usr/bin/env bash

# ask for admin password
sudo -v

# github repository
user="laranebula"
repo="macos"

#
# Dotfiles
#

dotfiles=( .profile )

for file in $dotfiles; do
  printf "checking for %s ... " $file
  if [ -e $HOME/$file ]; then
    printf "already there.\n" $file
  else
    printf "\ndownloading %s ... " $file
    curl https://raw.githubusercontent.com/$user/$repo/main/$file > $HOME/$file &> /dev/null
    [ -e $HOME/$file ] && printf "done.\n"
  fi
done

#
# Terminal
#

# removes last login details of zsh
[ -e $HOME/.hushlogin ] || touch $HOME/.hushlogin

# configurate terminal app
{
  defaults write com.apple.Terminal ShowLineMarks -int 0
}

#
# File System
#


#
# macOS
#
