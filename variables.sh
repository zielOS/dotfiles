#!/bin/sh
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

NVARCH=`uname -s`_`uname -m`; export NVARCH
NVCOMPILERS=/opt/nvidia/hpc_sdk; export NVCOMPILERS
MANPATH=$MANPATH:$NVCOMPILERS/$NVARCH/23.9/compilers/man; export MANPATH
PATH=$NVCOMPILERS/$NVARCH/23.9/compilers/bin:$PATH; export PATH 
export PATH=$NVCOMPILERS/$NVARCH/23.9/comm_libs/mpi/bin:$PATH
export MANPATH=$MANPATH:$NVCOMPILERS/$NVARCH/23.9/comm_libs/mpi/man
