
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

if [ "$JOB_NAME" != "" ]; then
	exit 0
fi

if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

if [ -f ~/.profile ]; then
	. ~/.profile
fi

#TODO: The below is really only necessary I think for work.
#Find better way to handle!


#source ~/.bashrc
#source ~/.profile

if [ -d "$HOME/.cargo/env" ]; then
  . "$HOME/.cargo/env"
fi

if [ -e /home/kohl/.nix-profile/etc/profile.d/nix.sh ]; then . /home/kohl/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
