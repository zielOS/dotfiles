#!/usr/bin/bash
for pkg in $(pacman -Q -q | grep 'python-\')
do 
  pbget $pkg
  cd $pkg
  makepkg -si --skipchecksums
  cd ..
done

