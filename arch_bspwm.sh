#!/bin/bash

cd  && git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si -r && cd

yay -S bspwm-git sxhkd-git brave-bin papirus-folders-catppuccin-git ripgrep fd python-pynvim nodejs-neovim ckb-next insync acct lsd python-pam sassc fnm zoxide zoom ly zotero emacs-nativecomp tdrop-git picom-ftlabs-git xdg-desktop-portal-gtk pipewire pipewire-alsa pipewire-pulse pipewire-jack pavucontrol wireplumber ripgrep playerctl polkit-gnome pamixer xdg-user-dirs wf-recorder dbus-python ttf-jetbrains-mono-nerd ttf-font-awesome mpv sxiv jgmenu xqp xdotool 

cd && mkdir ~/.npm-global && npm config set prefix '~/.npm-global'
LV_BRANCH='release-1.3/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.3/neovim-0.9/utils/installer/install.sh)



echo "Setting up Dotfiles"
sudo rm -R ~/.config/
cd && mkdir ~/.config
ln -s $HOME/.dots/.fonts $HOME/
ln -s $HOME/.dots/.themes $HOME/
ln -s $HOME/.dots/gentoo_setup $HOME/
ln -s $HOME/.dots/Projects $HOME/
ln -s $HOME/.dots/.local/bin/bspwm $HOME/.local/bin
ln -s $HOME/.dots/.gtkrc-2.0 $HOME/
ln -s $HOME/.dots/.xinitrc $HOME/
ln -s $HOME/.dots/.Xresources $HOME/
ln -s $HOME/.dots/catppuccin.css $HOME/
ln -s $HOME/.dots/.config/alacritty $HOME/.config/
ln -s $HOME/.dots/.config/bspwm $HOME/.config/
ln -s $HOME/.dots/.config/btop $HOME/.config/
ln -s $HOME/.dots/.config/ckb-next $HOME/.config/
ln -s $HOME/.dots/.config/dunst $HOME/.config/
ln -s $HOME/.dots/.config/eww $HOME/.config/
ln -s $HOME/.dots/.config/gammastep $HOME/.config/
ln -s $HOME/.dots/.config/gtk-3.0 $HOME/.config/
ln -s $HOME/.dots/.config/gtk-3.0 $HOME/.config/
ln -s $HOME/.dots/.config/jgmenu $HOME/.config/
ln -s $HOME/.dots/.config/Kvantum $HOME/.config/
ln -s $HOME/.dots/.config/lazygit $HOME/.config/
ln -s $HOME/.dots/.config/lsd $HOME/.config/
ln -s $HOME/.dots/.config/lvim $HOME/.config/
ln -s $HOME/.dots/.config/picom $HOME/.config/
ln -s $HOME/.dots/.config/polybar $HOME/.config/
ln -s $HOME/.dots/.config/qalculate $HOME/.config/
ln -s $HOME/.dots/.config/qt5ct $HOME/.config/
ln -s $HOME/.dots/.config/qt6ct $HOME/.config/
ln -s $HOME/.dots/.config/ranger $HOME/.config/
ln -s $HOME/.dots/.config/rofi $HOME/.config/
ln -s $HOME/.dots/.config/st $HOME/.config/
ln -s $HOME/.dots/.config/sxhkd $HOME/.config/
ln -s $HOME/.dots/.config/wallpapers $HOME/.config/
ln -s $HOME/.dots/.config/zathura $HOME/.config/
ln -s $HOME/.dots/.config/zsh $HOME/.config/


zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1
rm -R ~/.zshrc
ln -s $HOME/.dots/.zshrc $HOME/

#-----------------------------------------
#---- SETUP SYSTEMD ----------------------
#-----------------------------------------

echo "Setup Systemd"
sudo systemctl set-default graphical.target
systemctl --user enable --now wireplumber.service pipewire-pulse.socket pipewire.socket pipewire-pulse.service pipewire.service pipewire-pulse.socket pipewire.socket pipewire-pulse.service pipewire.service

