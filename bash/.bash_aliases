
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


# Path to dot files on personal computers.
if [ -d ~/gits/ClemensKohl/dotfiles ];
then
  DOTFILES=~/gits/ClemensKohl/dotfiles
  alias dfiles="cd ~/gits/ClemensKohl/dotfiles"
fi


# Yazi file explorer 
# Allows to change directory
function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# some more ls aliases
alias ll='ls -hlF'
alias la='ls -ahlF'
alias lesss='less -S'
alias lt='ls -ht'
alias tmux='tmux -u'
alias ssh='ssh -X'

alias lg="lazygit"

alias yz='yazi'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Aliases for my Neovim configs
alias dvim='NVIM_APPNAME=nvim.bak nvim'         # default neovim
alias vvim='NVIM_APPNAME=nvim nvim'             # lazy vim
alias kvim='NVIM_APPNAME=nvim-kickstart nvim'   # kickstart


alias load_R='module load bio/R-bundle-Bioconductor/3.18-foss-2023a-R-4.3.2'
alias unload_R='module unload bio/R-bundle-Bioconductor/3.18-foss-2023a-R-4.3.2'
alias busslinger='goto_busslinger'
alias rendeiro='goto_rendeiro'


goto_busslinger() {
  local base="/nobackup/lab_busslinger/ckohl"
  local target="$base"

  if [ -n "$1" ]; then
    target="$base/$1"
  fi

  if [ -d "$target" ]; then
    cd "$target" || echo "Failed to cd into $target"
  else
    echo "Directory does not exist: $target"
  fi
}

goto_rendeiro() {
  local base="/nobackup/lab_rendeiro/projects"
  local target="$base"

  if [ -n "$1" ]; then
    target="$base/$1"
  fi

  if [ -d "$target" ]; then
    cd "$target" || echo "Failed to cd into $target"
  else
    echo "Directory does not exist: $target"
  fi
}
