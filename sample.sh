#!/usr/bin/bash
pacman -Qm | grep '\-git'

echo "enter the pkg name"
read pkg
mkdir $pkg
cd $pkg
git clone https://gitlab.archlinux.org/archlinux/packaging/packages/$pkg.git
ls -al
