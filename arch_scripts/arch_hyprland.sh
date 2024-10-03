#!/bin/bash

##Install yay
cd && git clone https://aur.archlinux.org/yay-bin
cd yay-bin && makepkg -si
cd && sudo rm -R yay-bin

##Install BlackArch Repo
curl -O https://blackarch.org/strap.sh
chmod +x strap.sh
sudo ./strap.sh

yay -S \
  acpid alacritty arch-audit audit \
  btrfs-progs boost brave-bin btrfs-progs bleachbit brightnessctl \
  chrony curl cmake chkrootkit cups cliphist celluloid \
  dosfstools dbus-python devtools deluge \
  emacs-wayland \
  fd fzf flatpak fdupes fastfetch fnm fwupd \
  grim greetd gnome-keyring gjs gtk3 gtk4 gnome-bluetooth-3.0 gobject-introspection gtk-layer-shell gtk4-layer-shell grub grub-btrfs grub-customizer \
  haveged hyprlang hyprcursor hyprwayland-scanner hypridle hyprlock hyprnome hyprdim hyprpaper hyprpicker hyprland hyprshade \
  insync \
  jq jitterentropy-rngd \
  kitty kvantum kvantum-qt5 kvantum-theme-catppuccin-git \
  lazygit lynis libdbusmenu-gtk3 libsoup3 logrotate libva libva-nvidia-driver lsd \
  mesa mate-polkit mpv meson \
  networkmanager nwg-hello nwg-look nwg-drawer nodejs npm nvidia-open-dkms nvidia-utils nodejs-neovim \
  org.freedesktop.secrets \
  papirus-icon-theme python-pip python-pipx python-pynvim pipewire pipewire-alsa pipewire-pulse pipewire-jack pavucontrol pyprland python-pam \
  qt5-wayland qt6-wayland qt5ct qt6ct \
  rng-tools rust ripgrep ranger rkhunter \
  swappy sysstat slurp swww sassc snapper snap-pac snap-pac-grub spotify-launcher starship \
  tealdeer thunderbird thunar thunar-volman thunar-media-tags-plugin thunar-archive-plugin tumbler tree-sitter-cli ttf-jetbrains-mono-nerd ttf-jetbrains-mono ttf-ubuntu-font-family typescript \
  unzip unrar upower \
  vulkan-tools vulkan-headers vulkan-validation-layers \
  wl-clipboard wf-recorder wget wireplumber \
  xorg-xwayland xournalpp xarchiver xdg-user-dirs xdg-user-dirs-gtk xdg-desktop-portal-hyprland \
  zsh zsh-completions zathura zathura-pdf-poppler zoxide zip

echo "Installing Dot files"
cd
sudo rm -R $HOME/.local/
sudo rm -R $HOME/.config/
cd && mkdir $HOME/.config
cd && mkdir -p $HOME/.local/bin
ln -s $HOME/.dots/.config/kitty $HOME/.config/
ln -s $HOME/.dots/.config/alacritty $HOME/.config/
ln -s $HOME/.dots/.config/anyrun $HOME/.config/
ln -s $HOME/.dots/.config/btop $HOME/.config/
ln -s $HOME/.dots/.config/gtk-3.0 $HOME/.config/
ln -s $HOME/.dots/.config/gtk-4.0 $HOME/.config/
ln -s $HOME/.dots/.config/hypr $HOME/.config/
ln -s $HOME/.dots/.config/Kvantum $HOME/.config/
ln -s $HOME/.dots/.config/lazygit $HOME/.config/
ln -s $HOME/.dots/.config/lsd $HOME/.config/
ln -s $HOME/.dots/.config/nvim $HOME/.config/
ln -s $HOME/.dots/.config/starship.toml $HOME/.config/
ln -s $HOME/.dots/.config/ranger $HOME/.config/
ln -s $HOME/.dots/.config/Thunar $HOME/.config
ln -s $HOME/.dots/.config/qt5ct $HOME/.config/
ln -s $HOME/.dots/.config/qt6ct $HOME/.config/
ln -s $HOME/.dots/.config/wallpapers $HOME/.config/
ln -s $HOME/.dots/.config/zathura $HOME/.config/
ln -s $HOME/.dots/.config/zsh $HOME/.config/
ln -s $HOME/.dots/.gtkrc-2.0 $HOME/
ln -s $HOME/.dots/.themes $HOME/
ln -s $HOME/.dots/org $HOME/
ln -s $HOME/.dots/colorscheme.css $HOME/
ln -s $HOME/.dots/gentoo_setup $HOME/
ln -s $HOME/.dots/.local/bin/hypr/ $HOME/.local/bin/

cd && mkdir ~/.npm-global
npm config set prefix '~/.npm-global'

#-----------------------------------------
#---- SETUP SYSTEMD ----------------------
#-----------------------------------------

echo "Setup Systemd"
sudo systemctl set-default graphical.target
systemctl --user enable --now wireplumber.service pipewire-pulse.socket pipewire.socket pipewire-pulse.service pipewire.service pipewire-pulse.socket pipewire.socket pipewire-pulse.service pipewire.service

echo "Setup zsh"
zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1
cd && sudo rm -rf .zshrc
ln -s $HOME/.dots/.zshrc $HOME/
chsh -s $(which zsh)

echo "Setup Git"
cd
git config --global user.name "zielOS"
git config --global user.email "ahsanur041@gmail.com"
git config --global credential.helper /usr/lib/git-core/git-credential-libsecret

cd && sudo cp -R ~/.dots/variables.sh /etc/profile.d/

sudo systemctl enable --now jitterentropy sysstat rngd haveged cups avahi-daemon NetworkManager
