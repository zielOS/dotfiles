# /etc/profile: login shell setup
#
# That this file is used by any Bourne-shell derivative to setup the
# environment for login shells.
#

# Load environment settings from profile.env, which is created by
# env-update from the files in /etc/env.d
if [ -e /etc/profile.env ] ; then
	. /etc/profile.env
fi

# You should override these in your ~/.bashrc (or equivalent) for per-user
# settings.  For system defaults, you can add a new file in /etc/profile.d/.
export EDITOR=${EDITOR:-/usr/bin/emacs}
export PAGER=${PAGER:-/usr/bin/less}
export BROWSER="brave-bin"
export TERMINAL="alacritty"

export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/.local/bin/hypr
export PATH=$PATH:$HOME/.config/emacs/bin
export PATH=$PATH:$HOME/.npm-global/bin
export PATH=$PATH:/usr/local/texlive/2023/bin/x86_64-linux
export MANPATH=$MANPATH:/usr/local/texlive/2023/texmf-dist/doc/man
export INFOPATH=$INFOPATH/usr/local/texlive/2023/texmf-dist/doc/infoexport
export PATH=/opt/nvidia/hpc_sdk/Linux_x86_64/23.9/comm_libs/mpi/bin:$PATH
export MANPATH=$MANPATH:/opt/nvidia/hpc_sdk/Linux_x86_64/23.9/comm_libs/mpi/man

unset ROOTPATH

# process *.sh files in /etc/profile.d
for sh in /etc/profile.d/*.sh ; do
	[ -r "$sh" ] && . "$sh"
done
unset sh

if [ -n "${BASH_VERSION-}" ] ; then
	# Newer bash ebuilds include /etc/bash/bashrc which will setup PS1
	# including color.  We leave out color here because not all
	# terminals support it.
	if [ -f /etc/bash/bashrc ] ; then
		# Bash login shells run only /etc/profile
		# Bash non-login shells run only /etc/bash/bashrc
		# Since we want to run /etc/bash/bashrc regardless, we source it
		# from here.  It is unfortunate that there is no way to do
		# this *after* the user's .bash_profile runs (without putting
		# it in the user's dot-files), but it shouldn't make any
		# difference.
		. /etc/bash/bashrc
	else
		PS1='\u@\h \w \$ '
	fi
else
	# Setup a bland default prompt.  Since this prompt should be useable
	# on color and non-color terminals, as well as shells that don't
	# understand sequences such as \h, don't put anything special in it.
	PS1="${USER:-$(whoami 2>/dev/null)}@$(uname -n 2>/dev/null) \$ "
fi

umask 077
