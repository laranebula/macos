#!/usr/bin/env bash

# ask for admin password
sudo -v

#
# Dotfiles
#

dotfiles=( .profile )

for file in $dotfiles; do
  [ -e $file ] || curl https://raw.githubusercontent.com/laranebula/macos/master/$file > $HOME/$file &> /dev/null
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
