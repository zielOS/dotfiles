#!/bin/sh
sudo -i
apt update
apt dist-upgrade
apt install gnupg dirmngr
wget -q -O - https://archive.kali.org/archive-key.asc | gpg --import
echo "deb http://http.kali.org/kali kali-rolling main non-free contrib" > /etc/apt/sources.list.d/kali.list
gpg --export ED444FF07D8D0BF6 > /etc/apt/trusted.gpg.d/kali-rolling.gpg
apt update
apt -y upgrade
apt -y dist-upgrade
