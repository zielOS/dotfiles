#!/bin/sh

# git aliases
alias cl='git clone'
alias g='lazygit'

# zsh aliases
alias zsh-update="find "$ZDOTDIR/plugins" -type d -exec test -e '{}/.git' ';' -print0 | xargs -I {} -0 git -C {} pull -q"
alias f='zi'

# Pacman-related alias
alias em-up='sudo emerge -auqDN @world'
alias em-sync='sudo emerge --sync --quiet'
alias em-in='sudo emerge'
alias em-remove='sudo emerge -pv --depclean'
alias em-search='emerge -Ss'
alias em-rebuild='sudo emerge @preserved-rebuild'
alias em-clean='sudo eclean-dist --deep | sudo emerge --depclean'
alias use='sudo lvim /etc/portage/package.use'
alias keywords='sudo lvim /etc/portage/package.accept_keywords'
alias conf='sudo lvim /etc/portage/make.conf'
alias add-overla='sudo eselect repository enable'
alias em-list="equery list '*'"

alias pac-clean="sudo pacman -Scc && yay -Scc && yay -Yc && sudo pacman -Qtdq | sudo pacman -Rns -"
alias pac-in="yay -S"
alias pac-rm="yay -R"
alias pac-up="yay -Syyuu"
alias pac-clone="pkgctl repo clone --protocol=https"
alias pac-se="yay -Ss"
alias pac-make="makepkg -si --skippgpcheck --skipchecksum"

alias apt-up="sudo nala update && sudo nala upgrade"
alias apt-in="sudo nala install"
alias dnf-rm="sudo dnf5 remove"
alias apt-cl="sudo apt clean"
alias nala-se="nala search"

# Misc-related aliases
alias audit="sudo lynis audit system"
alias update-grub='sudo grub-install --target=x86_64-efi --efi-directory=/boot && sudo grub-install --target=x86_64-efi --efi-directory=/boot --removable && sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias grub-conf='sudo lvim /etc/default/grub'
alias Rm='sudo rm -rf'
# alias htkey-load='sudo pkill -HUP swhkd'
alias reload_emacs='killall emacs && emacs --daemon'
alias snapper='sudo lvim /etc/snapper/configs/root'
alias aa-status='sudo aa-status'
alias l='lsd'
alias la='lsd -a'
alias fetch="fastfetch"
alias egrep="grep -E"

if [[ $TERM == "xterm-kitty" ]]; then
  alias ssh="kitty +kitten ssh"
fi

case "$(uname -s)" in

Darwin)
	# echo 'Mac OS X'
	alias ls='ls -G'
	;;

Linux)
	alias ls='ls --color=auto'
	;;

CYGWIN* | MINGW32* | MSYS* | MINGW*)
	# echo 'MS Windows'
	;;
*)
	# echo 'Other OS'
	;;
esac
