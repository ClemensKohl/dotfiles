# dot_files
all my .dot files

This repository contains submodules. To clone it, do the following:
```bash
git clone git@github.com:ClemensKohl/dot_files.git
cd dot_files
git submodule init
git submodule update
```
If you want to add a submodule, run the following:
```bash
git submodule add <https://git/repo/url> <./path/to/folder>
```

# Manage dot files with GNU stow
You can simply use `stow` to manage all your simlinks.

The below commands will install the dotfiles in the correct subdirectories etc. :

```
cd /path/to/dot_files

stow --target=$HOME vim
stow --target=$HOME tmux
stow --target=$HOME ssh
stow --target=$HOME bash
stow --target=$HOME zsh
stow --target=$HOME R
stow --target=$HOME kitty
stow --target=$HOME git
stow --target=$HOME keyboard # Not working currently
stow --target=$HOME kde
stow --target=$HOME htop
stow --target=$HOME emacs
stow --target=$HOME btop
stow --target=$HOME zellij
stow --target=$HOME ranger

```

You can also stow everything at once:
```
stow --target=$HOME --restow */
```

But make sure there aren't any weird folders in your dot_files repository! (Backups, incorrect folder structure ...)
The --restow parameter tells stow to unstow the packages first before stowing them again.
If you want to unstow a package, you can use the following command:
``` bash
stow --target=$HOME --delete zsh
```

If you want a specific file or folder to be ignored (not stowed), add it to the `.stow-local-ignore` file.

# Bash configuration
Some things, e.g. conda initializaton and computer specific aliases are difficult to manage with one script.
For now, I store them in `~/.bash_aliases`. There they get still called and I can still sync .bashrc.

See also this guide for help with GNU stow:
https://venthur.de/2021-12-19-managing-dotfiles-with-stow.html

# Nerd Fonts
Fonts such as JetBrains Mono and Nerd Font Symbols are required for kitty and nvim. They can be obtained from here: https://github.com/ronniedroid/getnf

# OH-MY-ZSH
The ./zsh folder contains the custom directory used by [OH-MY-ZSH](https://github.com/ohmyzsh/ohmyzsh). When updating oh-m-zsh via `$ omz update` it will not update if the `$ZSH_CUSTOM` directory is symlinked to `~/.oh-my-zsh/custom`. Instead it is better to set the `$ZSH_CUSTOM` variable to the dotfiles folder in the `.zshrc` file. This is done in the `.zshrc` file shipped in this repository.

# TODO

## NeoVim
- [ ] Get plots to show in molten.
- [ ] Make utils toggle for color plugin.

