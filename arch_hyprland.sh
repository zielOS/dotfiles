#!/bin/bash

cd  && git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si -r && cd

yay -S hyprland-git fnm zoxide libva-nvidia-driver-git nvidia-dkms xdg-desktop-portal-hyprland xorg-xwayland qt5-wayland qt6-wayland qt5ct qt6ct libva pipewire pipewire-alsa pipewire-pulse pipewire-jack pavucontrol wireplumber ripgrep jq polkit-gnome swww thunar thunar-archive-plugin file-roller xdg-user-dirs wf-recorder dbus-python python-gobjec pyprland anyrun-git ripgrep fd python-pynvim nodejs-neovim ckb-next insync acct lsd python-pam swappy pavucontrol sassc swww ttf-jetbrains-mono-nerd ttf-font-awesome greetd-tuigreet mpv sxiv --noconfirm

cd && mkdir ~/.npm-global && npm config set prefix '~/.npm-global'
LV_BRANCH='release-1.3/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.3/neovim-0.9/utils/installer/install.sh) 

zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1

echo "Installing Dot files"
cd 
sudo rm -R ~/.config/
cd && mkdir ~/.config  
ln -s $HOME/.dots/.config/eww $HOME/.config/
ln -s $HOME/.dots/.config/arg $HOME/.config/
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
ln -s $HOME/.dots/.gtkrc-2.0 $HOME/
ln -s $HOME/.dots/.zshrc $HOME/
ln -s $HOME/.dots/.themes $HOME/
ln -s $HOME/.dots/Projects $HOME/
ln -s $HOME/.dots/colorscheme.css $HOME/
ln -s $HOME/.dots/gentoo_setup $HOME/

#-----------------------------------------
#---- SETUP SYSTEMD ----------------------
#-----------------------------------------

echo "Setup Systemd"
sudo systemctl set-default graphical.target 
systemctl --user enable --now wireplumber.service pipewire-pulse.socket pipewire.socket pipewire-pulse.service pipewire.service pipewire-pulse.socket pipewire.socket pipewire-pulse.service pipewire.service
