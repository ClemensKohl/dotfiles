# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
*i*) ;;
*) return ;;
esac

export EDITOR="nvim"
export VISUAL="nvim"

# set shorter prompt and make sure that we get a nice color terminal
PS1='\u@\h:\w \$'
PROMPT_DIRTRIM=2
if [[ $TERM == xterm ]]; then TERM=xterm-256color; fi
export PS1


# Set the shell tmux should use.
export TMUX_SHELL=$(which bash)

# add to path
# Commented out stuff is here in case something unexpectedly breaks.
# Paths should be defined in .profile

# PATH="$PATH:/bin:/usr/bin:/usr/sbin:/usr/local/package/bin:/usr/local/bin:$HOME/bin:$HOME/.local/bin:/home/$USER/build/texlive/bin/x86_64-linux"
# PATH="$PATH:$HOME/bin:$HOME/.local/bin:/home/$USER/build/texlive/bin/x86_64-linux"

export SSH_DEFAULT_USER=$USER

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ]; then
	PATH="$PATH:$HOME/bin"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ]; then
	PATH="$PATH:$HOME/.local/bin"
fi

PATH="$PATH:/usr/local/package/bin:/usr/local/bin"
PATH="$PATH:/home/$USER/build/texlive/bin/x86_64-linux:/home/$USER/.local/share/JetBrains/Toolbox/scripts"

export PATH

# Determine .Rprofile file:
#export R_PROFILE="$HOME/R/Rprofile.site"
export R_PROFILE="$HOME/.Rprofile"

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
	debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
xterm-color | *-256color | xterm-kitty) color_prompt=yes ;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
	if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
		# We have color support; assume it's compliant with Ecma-48
		# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
		# a case would tend to support setf rather than setaf.)
		color_prompt=yes
	else
		color_prompt=
	fi
fi

if [ "$color_prompt" = yes ]; then
	PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
	PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
# case "$TERM" in
# xterm*|rxvt*)
#     PS1='\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1'
#     ;;
# *)
#     ;;
# esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	alias ls='ls --color=auto'
	#alias dir='dir --color=auto'
	#alias vdir='vdir --color=auto'

	alias grep='grep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -hlF'
alias la='ls -ahlF'
alias lesss='less -S'
alias lt='ls -ht'
alias tmux='tmux -u'
alias ssh='ssh -X'

# Aliases for my Neovim configs
alias dv='NVIM_APPNAME=nvim.bak nvim'           # default neovim
alias dvim='NVIM_APPNAME=nvim.bak nvim'         # default neovim

alias lv='lvim'                                 # Lunar Vim
alias lvim='lvim'                               # Lunar Vim

# nvim by default also opens neovim with lazyvim.
alias vv='NVIM_APPNAME=nvim nvim'               # lazy vim
alias vvim='NVIM_APPNAME=nvim nvim'             # lazy vim

alias kv='NVIM_APPNAME=nvim-kickstart nvim'     # kickstart
alias kvim='NVIM_APPNAME=nvim-kickstart nvim'   # kickstart

# Path to dot files on personal computers.
if [ -d ~/gits/ClemensKohl/dot_files ];
then
  alias dfiles="cd ~/gits/ClemensKohl/dot_files"

# Path to dot files on work computer
elif [ -d ~/PhD/gits/ClemensKohl/dot_files ];
then
  alias dfiles="cd ~/PhD/gits/ClemensKohl/dot_files"
fi


# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
	if [ -f /usr/share/bash-completion/bash_completion ]; then
		. /usr/share/bash-completion/bash_completion
	elif [ -f /etc/bash_completion ]; then
		. /etc/bash_completion
	fi
fi

# Vim mode
set -o vi

# Deactivate auto-activation of base environment
export CONDA_AUTO_ACTIVATE_BASE=false
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/clemens/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/clemens/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/clemens/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/clemens/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

