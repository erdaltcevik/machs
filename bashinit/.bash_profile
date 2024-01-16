#
# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
#

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

PATH="$PATH:$HOME/.local/bin"

#PATH="$PATH:/src/buildroot/output/host/bin"
#PATH="$PATH:$HOME/arm-brana-linux-gnueabihf/bin"
#PATH="$PATH:$HOME/motab-sdk/bin"
#PATH="$PATH:/opt/gcc-arm-9.2-2019.12-x86_64-arm-none-linux-gnueabihf/bin"
PATH="$PATH:/opt/gcc-arm-11.2-2022.02-x86_64-arm-none-linux-gnueabihf/bin"

setleds -D +num

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

