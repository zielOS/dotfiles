#!/usr/bin/bash
grep 'python-/' /var/lib/portage/world | xargs --open-tty emerge --ask --deselect; emerge --ask --depclean

for pkg in $(pacman -Q -q | grep 'python-')
do 
  git clone https://gitlab.archlinux.org/archlinux/packaging/packages/$pkg
done


echo "enter the pkg name"
read pkg
mkdir $pkg
cd $pkg
git clone https://gitlab.archlinux.org/archlinux/packaging/packages/$pkg
ls -al
