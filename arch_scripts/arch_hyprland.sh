#!/bin/bash
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

sudo systemctl enable --now jitterentropy sysstat acct rngd haveged cups avahi-daemon NetworkManager
