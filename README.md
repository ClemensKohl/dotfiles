# dot_files
all my .dot files

# Manage dot files with GNU stow
You can simply use `stow` to manage all your simlinks.

The below commands will install the dotfiles in the correct subdirectories etc. :

```
cd /path/to/dot_files

stow --target=$HOME vim
stow --target=$HOME tmux
stow --target=$HOME ssh
stow --target=$HOME bash

```

You can also stow everything at once:
```
stow --target=$HOME --restow */
```

But make sure there aren't any weird folders in your dot_files repository! (Backups, incorrect folder structure ...)
The --restow parameter tells stow to unstow the packages first before stowing them again.

> ⚠️  Currently there is the bak folder which should be removed!

# Bash configuration
Some things, e.g. conda initializaton and computer specific aliases are difficult to manage with one script.
For now, I store them in `~/.bash_aliases`. There they get still called and I can still sync .bashrc.

See also this guide for help with GNU stow:
https://venthur.de/2021-12-19-managing-dotfiles-with-stow.html


