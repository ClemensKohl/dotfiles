#PS1="\u@\h:\w> "
PS1='\u@\h:\w \$'; PROMPT_DIRTRIM=2


PATH="$PATH:/bin:/usr/bin:/usr/sbin:/usr/local/package/bin:/usr/local/bin:$HOME/bin:$HOME/.local/bin:/home/kohl/build/texlive/bin/x86_64-linux"


#PATH=/bin:/usr/bin:/usr/sbin:/usr/local/package/bin:/usr/local/bin:$HOME/bin:$HOME/.local/bin:$PATH:/home/kohl/build/texlive/bin/x86_64-linux
export PS1 PATH

umask 007


# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

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
#case "$TERM" in
#xterm*|rxvt*)
#   PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
#   ;;
#*)
#    ;;
#esac


# Aliases


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

alias ll='ls -hlF'
alias la='ls -ahlF'
alias lesss='less -S'
alias lt='ls -ht'
alias windows='rdesktop -u kohl -d wis-net -g 1920x1280 winter'
alias rstudio4='prun R-4.0.5-0 rstudio'
alias Rscript4.0.5='prun R-4.0.5-0 Rscript'
alias rstudio41='prun R-4.1.0-0 rstudio'
alias rstudio42='prun R-4.2.1-0 rstudio'
alias Rscript41='prun R-4.1.0-0 Rscript'
alias radian41='radian --r-binary=/usr/local/package/bin/R-4.1.0'
alias radian42='radian --r-binary=/usr/local/package/bin/R-4.2.1'
alias mxq-killall='$HOME/bin/mxqkillall.sh'
alias mxqinfo="$HOME/bin/mxqtab.sh | column -t -s $'\t' | less -S"

export R_PROFILE="/home/kohl/R/Rprofile.site"

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/.local/lib:$HOME/.local/bin:$HOME/.local/include
export GDAL_DATA=$HOME/.local/share/gdal
#export PATH=/home/kohl/yard/cellranger-5.0.1/bin:$PATH
#
 # >>> conda initialize >>>
 # !! Contents within this block are managed by 'conda init' !!
 __conda_setup="$('/home/kohl/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
 if [ $? -eq 0 ]; then
     eval "$__conda_setup"
 else
     if [ -f "/home/kohl/miniconda3/etc/profile.d/conda.sh" ]; then
         . "/home/kohl/miniconda3/etc/profile.d/conda.sh"
     else
         export PATH="/home/kohl/miniconda3/bin:$PATH"
     fi
 fi
 unset __conda_setup
 # <<< conda initialize <<<
