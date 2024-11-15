#!/usr/bin/env bash

# ask for admin password
sudo -v

#
# Dotfiles
#
for file in ( .profile )
do
  [ -e $file ] || curl https://raw.githubusercontent.com/laranebula/macos/master/$file > $HOME/$file &> /dev/null
done

#
# File System
#


#
# macOS
#
