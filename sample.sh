#!/usr/bin/bash
for pkg in $(pacman -Q -q | grep 'python-')
do 
  pkgctl repo clone --protocol=https $pkg
  cd $pkg
  makepkg -si --skipchecksums --noconfirm
  cd ..
done

# displays package count

pacman -Q | wc -l

