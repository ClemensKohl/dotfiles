# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

export LOADED="PROFILE"
# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

if [[ "$(whoami)" == "kohl" ]]; then
	export LOADED="BASH_PROFILE"
	PATH="$PATH:/usr/local/package/bin:/usr/local/bin"
	PATH="$PATH:/home/$USER/build/texlive/bin/x86_64-linux:/home/$USER/.local/share/JetBrains/Toolbox/scripts"

	if [ -d "$HOME/.npm-global/bin" ]; then
		PATH="$PATH:$HOME/.npm-global/bin"
	fi

	if [ -d "$HOME/bin" ]; then
		PATH=$HOME/bin:$PATH
	fi

	if [ -d "$HOME/.local/bin" ]; then
		PATH=$HOME/.local/bin:$PATH
	fi

	export PATH

	export R_PROFILE="$HOME/.Rprofile"
fi

if [[ "$(whoami)" == "clemens" ]]; then
	export LOADED="BASH_PROFILE"

	if [ -d "$HOME/bin" ]; then
		PATH=$HOME/bin:$PATH
	fi

	if [ -d "$HOME/.local/bin" ]; then
		PATH=$HOME/.local/bin:$PATH
	fi

	export PATH

	export R_PROFILE="$HOME/.Rprofile"
fi

. "$HOME/.cargo/env"
