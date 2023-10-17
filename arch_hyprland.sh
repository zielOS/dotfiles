#!/bin/bash

cd  && git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si -r && cd

yay -S hyprland-nvidia-git libva-nvidia-driver-git nvidia-dkms xdg-desktop-portal-hyprland xorg-xwayland qt5-wayland qt6-wayland qt5ct qt6ct libva linux-zen-headers pipewire pipewire-alsa pipewire-pulse pipewire-jack pavucontrol wireplumber ripgrep playerctl gradience-git adw-gtk3-git jq eww-tray-wayland-git polkit-gnome swww gtklock pamixer cliphist grimblast-git gnome-control-center thunar thunar-archive-plugin file-roller xdg-user-dirs wf-recorder dbus-python python-gobject python-requests python-jinja python-material-color-utilities zenity socat swhkd-git pyprland anyrun waybar-hyprland-git ripgrep fd python-pynvim nodejs-neovim ckb-next insync acct lsd python-pam swappy pavucontrol sassc swww ttf-jetbrains-mono-nerd ttf-font-awesome greetd-tuigreet mpv sxiv

cd && mkdir ~/.npm-global && npm config set prefix '~/.npm-global'
LV_BRANCH='release-1.3/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.3/neovim-0.9/utils/installer/install.sh) 

curl -fsSL https://fnm.vercel.app/install | bash
curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1

echo "Installing Dot files"
cd 
sudo rm -R ~/.config/
cd && mkdir ~/.config  
ln -s $HOME/.dots/.config/eww $HOME/.config/
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
