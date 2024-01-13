#!/usr/bin/bash
for pkg in $(dnf list --installed | awk -F'.' '{print $1}')
do 
  dnf download --source $pkg | rpm -Uvh 
  rpmbuild -rcfile=~/.rpmc -bs ~/rpmbuild/SPECS/$pkg.spec
  rpmbuild -rcfile=~/.rpmc -bb ~/rpmbuild/SPECS/$pkg.spec
pone

# displays package count

dnf list --installed | awk '{print $1}' | wc -l

dnf list --installed | wc -l

