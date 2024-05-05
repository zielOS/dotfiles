#!/bin/bash

echo "Setting up Repos"
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm 

sudo dnf install dnf5

sudo dnf copr enable atim/lazygit
sudo dnf copr enable atim/alacritty
sudo dnf copr enable atim/starship
sudo dnf copr enable solopasha/hyprland
sudo dnf update

echo "Installing Several Packages"
sudo dnf5 install -y starship xournalpp gnome-themes-extra flatpak kitty alacritty zoxide pixman polkit-devel xisxwayland tree-sitter xorg-x11-server-Xwayland xorg-x11-server-Xwayland-devel grim slurp wf-recorder wl-clipboard polkit-gnome pipewire pipewire-alsa pipewire-pulseaudio pipewire-utils wireplumber alsa-utils thunar thunar-volman thunar-media-tags-plugin thunar-archive-plugin tumbler file-roller kvantum qt5ct zsh util-linux-user sysstat psacct rng-tools cronie wget aide lynis mpv deluge copr-selinux zathura zathura-zsh-completion zathura-pdf-poppler qt5-qtwayland qt6-qtwayland power-profiles-daemon libva-devel  vulkan zsh-autosuggestions zsh-syntax-highlighting nvidia-vaapi-driver libva-utils vdpauinfo nodejs npm papirus-icon-theme python3-devel gnome-keyring lazygit plymouth-theme-spinner ninja-build cmake meson gcc-c++ libxcb gtkmm3.0-devel kernel-devel alsa-utils sassc boom-boot fd-find ripgrep rust cargo python3-neovim swww pavucontrol emacs pamixer pipx && sudo plymouth-set-default-theme spinner -R

echo "Installing Hyprland Packafes"
sudo dnf5 install -y cliphist hyprcursor hyprdim hypridle hyprland-git hyprland-contrib hyprland-welcome hyprlang hyprlock hyprnome hyprpaper hyprpicker wayshot hyprwayland-scanner pyprland wayland-protocols tomlplusplus

echo "Installing Ags & Apps"
sudo dnf5 install typescript npm meson gjs-devel gtk3-devel gtk-layer-shell gnome-bluetooth upower NetworkManager pulseaudio-libs-devel libdbusmenu-gtk3 libsoup3 brightnessctl swappy pam-devel

npm install -g bun
npm install -g sass
cargo install matugen

cd && git clone --recursive https://github.com/Aylur/ags.git
cd ags
npm install
meson setup build
sudo meson install -C build && cd

echo "Install asus apps"
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install akmod-nvidia xorg-x11-drv-nvidia-cuda
sudo systemctl enable nvidia-hibernate.service nvidia-suspend.service nvidia-resume.service nvidia-powerd.service
sudo dnf copr enable lukenukem/asus-linux
sudo dnf update

sudo dnf install asusctl supergfxctl
sudo dnf update --refresh
sudo systemctl enable supergfxd.service

sudo dnf install asusctl-rog-gui

echo "Installing brave-browser"
sudo dnf install dnf-plugins-core
sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo
sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
sudo dnf5 install brave-browser


echo "Installing Dot files"
sudo rm -R ~/.config/
cd && mkdir ~/.config 
ln -s $HOME/.dots/.config/alacritty $HOME/.config/
ln -s $HOME/.dots/.config/kitty $HOME/.config/
ln -s $HOME/.dots/.config/anyrun $HOME/.config/
ln -s $HOME/.dots/.config/btop $HOME/.config 
ln -s $HOME/.dots/.config/gtk-3.0 $HOME/.config/
ln -s $HOME/.dots/.config/gtk-4.0 $HOME/.config/
ln -s $HOME/.dots/.config/hypr  $HOME/.config/
ln -s $HOME/.dots/.config/Kvantum  $HOME/.config/
ln -s $HOME/.dots/.config/lazygit $HOME/.config/
ln -s $HOME/.dots/.config/lsd  $HOME/.config/
ln -s $HOME/.dots/.Thunar $HOME/
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
LV_BRANCH='release-1.3/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.3/neovim-0.9/utils/installer/install.sh)
sudo rm -rf ~/.config/lvim 
ln -s $HOME/.dots/.config/lvim ~/.config/

curl -fsSL https://fnm.vercel.app/install | sh
zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh)
rm -R .zshrc
ln -s $HOME/.dots/.zshrc ~/
chsh -s $(which zsh)

git clone https://github.com/Aylur/dotfiles.git && cd dotfiles
cp -R ags ~/.config/ && cd

sudo cp -R ~/.dots/variables.sh /etc/profile.d/
git config --global user.name "zielOS"
git config --global user.email "ahsanur041@gmail.com"

