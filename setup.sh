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

printf "# setting up dotfiles...\n"

for file in $dotfiles; do
  printf "searching for %s ... " $file
  if [ -e $HOME/$file ]; then
    printf "already there.\n"
  else
    printf "downloading ... "
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
#{
#  defaults write com.apple.Terminal ShowLineMarks -int 0
#}

#
# File System
#

directories=(  )

printf "# setting up file system...\n"

for directory in $directories; do
  printf "searching for %s ... " $directory
  if [ -d $HOME/$directory ]; then
    printf "already there.\n"
  else
    printf "creating ... "
    mkdir $HOME/$directory &> /dev/null
    [ -d $HOME/$directory ] && printf "done.\n"
  fi
done

#
# macOS
#
