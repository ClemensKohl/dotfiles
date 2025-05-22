# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if [ -d "$HOME/.npm-global/bin" ]; then
  export PATH="$PATH:$HOME/.npm-global/bin"
fi

if [ -d "$HOME/.config/emacs/bin" ]; then
  export PATH="$PATH:$HOME/.config/emacs/bin"
fi

if [ -d "/opt/nvim-linux-x86_64" ]; then
	export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
fi
# Set the shell tmux should use.
export TMUX_SHELL=$(which zsh)

# Download and install .zsh if not present.
# [[ -x $HOME/.oh-my-zsh ]] || sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Set to vim keybindings.
bindkey -v

# Setup dotfiles directory path
if [ -d ~/gits/ClemensKohl/dotfiles ];
then
  DOTFILES=~/gits/ClemensKohl/dotfiles
elif [ -d ~/PhD/gits/ClemensKohl/dotfiles ]
then
  DOTFILES=~/PhD/gits/ClemensKohl/dotfiles
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# set ZSH_CUSTOM to dotfiles folder.
export ZSH_CUSTOM=$DOTFILES/zsh/.oh-my-zsh/custom

# If you come from bash you might have to change your $PATH.
# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ]; then
	PATH=$HOME/bin:$PATH
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ]; then
	PATH=$HOME/.local/bin:$PATH
fi
export PATH=$PATH:/usr/local/bin:/usr/local/package/bin

# Set SSH User
export SSH_DEFAULT_USER=$USER

# Determine .Rprofile file:
export R_PROFILE="$HOME/.Rprofile"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-autosuggestions # github.com/zsh-users/zsh-autosuggestions
  zsh-vi-mode # https://github.com/jeffreytse/zsh-vi-mode
  zsh-syntax-highlighting # Must be last! github.com/zsh-users/zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
  export VISUAL='nvim'
else
  export EDITOR='nvim'
  export VISUAL='nvim'
fi

# Enable fzf
# FZF_KEYBINDS="/usr/local/share/examples/fzf/shell/key-bindings.zsh"
# if [ -f $FZF_KEYBINDS ]; then
#   source $FZF_KEYBINDS
# fi
#
# FZF_COMP="/usr/local/share/examples/fzf/shell/completion.zsh"
# if [ -f $FZF_COMP ]; then
#   source $FZF_COMP
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

if [ -f ~/.zsh_aliases ];
then
    . ~/.zsh_aliases;
fi

alias lesss='less -S'
alias tmux='tmux -u'
alias ssh='ssh -X'

# use the configs set in ~/.config/kitty/ssh.conf
# for a ssh sesison.
alias kkh='kitten ssh -X'

# Aliases for my Neovim configs
alias dv='NVIM_APPNAME=nvim.bak nvim'           # default neovim
alias dvim='NVIM_APPNAME=nvim.bak nvim'         # default neovim

# nvim by default also opens neovim with lazyvim.
alias nv='NVIM_APPNAME=nvim nvim'               # lazy vim

alias kv='NVIM_APPNAME=nvim-kickstart nvim'     # kickstart
alias kvim='NVIM_APPNAME=nvim-kickstart nvim'   # kickstart

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

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




# Deactive conda auto activation
export CONDA_AUTO_ACTIVATE_BASE=false

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('$HOME/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
        . "$HOME/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/PhD/gits/ClemensKohl/dotfiles/zsh/.p10k.zsh.
[[ ! -f ~/PhD/gits/ClemensKohl/dotfiles/zsh/.p10k.zsh ]] || source ~/PhD/gits/ClemensKohl/dotfiles/zsh/.p10k.zsh
