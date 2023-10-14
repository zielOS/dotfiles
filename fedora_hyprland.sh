#!/bin/bash

echo "Setting up Repos"
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm 

sudo dnf copr enable atim/lazygit 
sudo dnf copr enable atim/alacritty
sudo dnf copr enable solopasha/hyprland
sudo dnf update

echo "Installing Several Packages"
sudo dnf install alacritty xdg-desktop-portal-hyprland hyprland-nvidia-git waybar-git eww-wayland-git pixman polkit-devel xisxwayland xorg-x11-server-Xwayland xorg-x11-server-Xwayland-devel swaybg swayidle swaylock grim slurp wf-recorder wl-clipboard polkit-gnome pipewire pipewire-alsa pipewire-pulseaudio pipewire-utils wireplumber alsa-utils thunar thunar-volman thunar-media-tags-plugin thunar-archive-plugin file-roller  kvantum qt5ct neofetch zsh util-linux-user sysstat psacct rng-tools cronie wget aide lynis mpv transmission-gtk copr-selinux zathura zathura-zsh-completion zathura-pdf-poppler qt5-qtwayland acpi libva-devel akmod-nvidia nodejs npm papirus-icon-theme python3-devel gnome-keyring lazygit plymouth-theme-spinner ninja-build cmake meson gcc-c++ libxcb gtkmm3.0-devel alsa-utils yad ckb-next sassc boom-boot && sudo plymouth-set-default-theme spinner -R
 
echo "Installing emacs"
sudo dnf builddep emacs
wget https://gnu.mirror.constant.com/emacs/emacs-29.1.tar.xz
tar -xvf emacs-29.1.tar.xz && cd emacs-29.1 && ./autogen.sh
./configure --with-motif --with-native-compilation --with-modules --with-json --with-mailutils --with-imagemagick --with-tree-sitter --with-xft --with-modules --with-threads --with-harfbuzz --with-sqlite3 --without-jpeg --without-tiff --without-gif --without-png --without-rsvg --without-webp
make -j22
sudo make install && cd

echo "Installing ags"
sudo dnf install typescript npm meson gjs-devel gtk3-devel gtk-layer-shell gnome-bluetooth upower NetworkManager pulseaudio-libs-devel libdbusmenu-gtk3
git clone --recursive https://github.com/Aylur/ags.git && cd ags
npm install
meson setup build
sudo meson install -C build && cd


echo "Installing Dot files"
sudo rm -R ~/.config/
cd && mkdir ~/.config 
ln -s $HOME/.dots/config/ags/ ~/.config/
ln -s $HOME/.dots/config/alacritty/ ~/.config/
ln -s $HOME/.dots/config/gtk-3.0/ ~/.config/
ln -s $HOME/.dots/config/wallpapers/ ~/.config/
ln -s $HOME/.dots/config/zathura/ ~/.config/
ln -s $HOME/.dots/config/zsh/ ~/.config/
ln -s $HOME/.dots/config/hypr/ ~/.config/
ln -s $HOME/.dots/config/electron-flags.conf ~/.config/
ln -s $HOME/.dots/config/electron13-flags.conf ~/.config/
ln -s $HOME/.dots/.fonts/ ~/
ln -s $HOME/.dots/.themes/ ~/
ln -s $HOME/.dots/.gtkrc-2.0/ ~/
ln -s $HOME/.dots/config/eww ~/.config/
ln -s $HOME/.dots/config/ckb-next/ ~/.config/
ln -s $HOME/.dots/config/Thunar/ ~/.config/

echo "Setting Up Systemd"
sudo systemctl set-default graphical.target 
systemctl --user enable --now wireplumber.service pipewire-pulse.socket pipewire.socket pipewire-pulse.service pipewire.service pipewire-pulse.socket pipewire.socket pipewire-pulse.service pipewire.service

cd && mkdir ~/.npm-global && npm config set prefix '~/.npm-global' 

curl -fsSL https://fnm.vercel.app/install | sh
curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh)
rm -R .zshrc
ln -s $HOME/.dots/.zshrc ~/
chsh -s $(which zsh)
