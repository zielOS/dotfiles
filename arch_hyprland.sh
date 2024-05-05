#!/bin/bash

rustup default stable

yay -S fnm hyprlang-git hyprcursor-git hyprwayland-scanner zoxide libva-nvidia-driver-git nvidia-dkms xdg-desktop-portal-hyprland xorg-xwayland qt5-wayland qt6-wayland qt5ct qt6ct libva pipewire pipewire-alsa pipewire-pulse pipewire-jack pavucontrol wireplumber ripgrep jq polkit-gnome swww thunar thunar-archive-plugin file-roller xdg-user-dirs wf-recorder dbus-python python-gobjec pyprland anyrun-git ripgrep fd python-pynvim rkhunter chkrootkit nodejs-neovim tree-sitter-cli spotify-launcher transmission-qt stacer-bin bleachbit ckb-next insync alacritty kitty acct lsd python-pam swappy pavucontrol steam lutris devtools xournalpp mailspring logrotate ranger sassc swww ttf-jetbrains-mono-nerd ttf-font-awesome greetd-tuigreet mpv kvantum brave-bin kvantum jitterentropy-rngd hyprshade fluidsynth wine-staging fwupd aylurs-gtk-shell-git alhp-keyring alhp-mirrorlist fastfetch gnome-keyring libgnome-keyring org.freedesktop.secrets cups arch-audit

sudo pacman -S typescript npm meson gjs gtk3 gtk-layer-shell gnome-bluetooth-3.0 upower networkmanager gobject-introspection libdbusmenu-gtk3 libsoup3 hyprland-git

git clone https://github.com/donovanglover/hyprnome -b 0.2.0 && cd hyprnome && makepkg -si && cd

zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v2

echo "Installing Dot files"
cd 
sudo rm -R ~/.config/
cd && mkdir ~/.config  
ln -s $HOME/.dots/.config/kitty $HOME/.config/
ln -s $HOME/.dots/.config/alacritty $HOME/.config/
ln -s $HOME/.dots/.config/anyrun $HOME/.config/
ln -s $HOME/.dots/.config/btop $HOME/.config/
ln -s $HOME/.dots/.config/ckb-next $HOME/.config/ 
ln -s $HOME/.dots/.config/gtk-3.0 $HOME/.config/
ln -s $HOME/.dots/.config/gtk-4.0 $HOME/.config/
ln -s $HOME/.dots/.config/hypr  $HOME/.config/
ln -s $HOME/.dots/.config/Kvantum  $HOME/.config/
ln -s $HOME/.dots/.config/lazygit $HOME/.config/
ln -s $HOME/.dots/.config/lsd  $HOME/.config/
ln -s $HOME/.dots/Thunar $HOME/
ln -s $HOME/.dots/.config/qt5ct  $HOME/.config/
ln -s $HOME/.dots/.config/qt6ct  $HOME/.config/
ln -s $HOME/.dots/.config/wallpapers  $HOME/.config/
ln -s $HOME/.dots/.local/bin/hypr $HOME/.local/bin
ln -s $HOME/.dots/.config/zathura  $HOME/.config/
ln -s $HOME/.dots/.config/zsh $HOME/.config/
ln -s $HOME/.dots/.gtkrc-2.0 $HOME/
ln -s $HOME/.dots/.zshrc $HOME/
ln -s $HOME/.dots/.themes $HOME/
ln -s $HOME/.dots/org $HOME/
ln -s $HOME/.dots/colorscheme.css $HOME/
ln -s $HOME/.dots/gentoo_setup $HOME/

cd && mkdir ~/.npm-global && npm config set prefix '~/.npm-global'
LV_BRANCH='release-1.3/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.3/neovim-0.9/utils/installer/install.sh) 

sudo rm -rf ~/.config/lvim && cd
ln -s $HOME/.dots/.config/lvim ~/.config

cd ~/.local/bin 
sudo install -Dm755 lvim "/usr/local/bin/lvim" && sudo rm -rf lvim && cd

#-----------------------------------------
#---- SETUP SYSTEMD ----------------------
#-----------------------------------------

echo "Setup Systemd"
sudo systemctl set-default graphical.target 
systemctl --user enable --now wireplumber.service pipewire-pulse.socket pipewire.socket pipewire-pulse.service pipewire.service pipewire-pulse.socket pipewire.socket pipewire-pulse.service pipewire.service

echo "Setup Git"
cd 
git config --global user.name "zielOS"
git config --global user.email "ahsanur041@gmail.com"
git config --global credential.helper /usr/lib/git-core/git-credential-libsecret

cd && sudo cp -R ~/.dots/variables.sh /etc/profile.d/

sudo systemctl enable --now jitterentropy rngd haveged cups ckb-next-daemon avahi-daemon
