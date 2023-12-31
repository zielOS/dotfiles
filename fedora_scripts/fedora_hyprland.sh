#!/bin/bash

echo "Setting up Repos"
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm 

sudo dnf install dnf5

sudo dnf copr enable alebastr/sway-extras 
sudo dnf copr enable atim/lazygit
sudo dnf copr enable atim/alacritty
sudo dnf copr enable atim/starship
sudo dnf copr enable solopasha/hyprland
sudo dnf update

echo "Installing Several Packages"
sudo dnf5 install -y gnome-software xournalpp gnome-themes-extra texlive flatpak kitty alacritty zoxide xdg-desktop-portal-hyprland hyprland-git pixman polkit-devel xisxwayland xorg-x11-server-Xwayland xorg-x11-server-Xwayland-devel swaybg swayidle swaylock grim slurp wf-recorder wl-clipboard polkit-gnome pipewire pipewire-alsa pipewire-pulseaudio pipewire-utils wireplumber alsa-utils thunar thunar-volman thunar-media-tags-plugin thunar-archive-plugin tumbler file-roller kvantum qt5ct neofetch zsh util-linux-user sysstat psacct rng-tools cronie wget aide lynis mpv transmission-gtk copr-selinux zathura zathura-zsh-completion zathura-pdf-poppler qt5-qtwayland qt6-qtwayland power-profiles-daemon libva-devel akmod-nvidia xorg-x11-drv-nvidia-power vulkan zsh-autosuggestions zsh-syntax-highlighting nvidia-vaapi-driver libva-utils vdpauinfo nodejs npm papirus-icon-theme python3-devel gnome-keyring lazygit plymouth-theme-spinner ninja-build cmake meson gcc-c++ libxcb gtkmm3.0-devel alsa-utils steam ckb-next sassc boom-boot swww pavucontrol pamixer pipx && sudo plymouth-set-default-theme spinner -R

echo "Installing Cuda drivers"
sudo dnf config-manager --add-repo https://developer.download.nvidia.com/compute/cuda/repos/fedora37/x86_64/cuda-fedora37.repo
sudo dnf5 clean all 
sudo dnf5 module disable nvidia-driver
sudo dnf5 install -y cuda

echo "Installing cudnn"
sudo dnf config-manager --add-repo https://developer.download.nvidia.com/compute/cuda/repos/rhel9/x86_64/cuda-rhel9.repo
sudo dnf5 install -y libcudnn8 libcudnn8-devel libcudnn8-samples 

echo "Installing nvhpc"
sudo dnf config-manager --add-repo https://developer.download.nvidia.com/hpc-sdk/rhel/nvhpc.repo
sudo dnf5 install -y nvhpc-23.11

echo "Installing brave-browser"
sudo dnf install dnf-plugins-core
sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo
sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
sudo dnf5 install brave-browser

echo "Installing Flatpak apps"
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install flathub net.lutris.Lutris
flatpak install flathub com.github.tchx84.Flatseal
flatpak install flathub org.ferdium.Ferdium
flatpak install flathub org.libreoffice.LibreOffice
flatpak install flathub org.geogebra.GeoGebra

echo "Installing Dot files"
sudo rm -R ~/.config/
cd && mkdir ~/.config 
ln -s $HOME/.dots/.config/alacritty $HOME/.config/
ln -s $HOME/.dots/.config/kitty $HOME/.config/
ln -s $HOME/.dots/.config/anyrun $HOME/.config/
ln -s $HOME/.dots/.config/btop $HOME/.config/
ln -s $HOME/.dots/.config/ckb-next $HOME/.config/ 
ln -s $HOME/.dots/.config/gtk-3.0 $HOME/.config/
ln -s $HOME/.dots/.config/gtk-4.0 $HOME/.config/
ln -s $HOME/.dots/.config/hypr  $HOME/.config/
ln -s $HOME/.dots/.config/Kvantum  $HOME/.config/
ln -s $HOME/.dots/.config/lazygit $HOME/.config/
ln -s $HOME/.dots/.config/lsd  $HOME/.config/
ln -s $HOME/.dots/.config/Thunar $HOME/.config/
ln -s $HOME/.dots/.config/qt5ct  $HOME/.config/
ln -s $HOME/.dots/.config/qt6ct  $HOME/.config/
ln -s $HOME/.dots/.config/wallpapers  $HOME/.config/
ln -s $HOME/.dots/.config/waybar $HOME/.config/
ln -s $HOME/.dots/.local/bin/hypr $HOME/.local/bin
ln -s $HOME/.dots/.config/zathura  $HOME/.config/
ln -s $HOME/.dots/.config/zsh $HOME/.config/
ln -s $HOME/.dots/.config/starship.toml $HOME/.config/
ln -s $HOME/.dots/.gtkrc-2.0 $HOME/
ln -s $HOME/.dots/.themes $HOME/
ln -s $HOME/.dots/org $HOME/
ln -s $HOME/.dots/colorscheme.css $HOME/
ln -s $HOME/.dots/gentoo_setup $HOME/

echo "Setting Up Systemd"
sudo systemctl set-default graphical.target 
systemctl --user enable --now wireplumber.service pipewire-pulse.socket pipewire.socket pipewire-pulse.service pipewire.service pipewire-pulse.socket pipewire.socket pipewire-pulse.service pipewire.service

cd && mkdir ~/.npm-global && npm config set prefix '~/.npm-global' 

curl -fsSL https://fnm.vercel.app/install | sh
zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh)
rm -R .zshrc
ln -s $HOME/.dots/.zshrc ~/
chsh -s $(which zsh)
