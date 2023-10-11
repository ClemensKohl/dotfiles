

" ADDED by CLEMENS

" Basic settings
syntax on
set background=dark

set number
set showmatch " Shows matching brackets
set ruler " Always shows location in file (line#)
set smarttab " Autotabs for certain code
set ts=4 sw=4 " Sets the tabs to 4 spaces.
set backspace=indent,eol,start

set clipboard=unnamedplus " Supposed to help copy/paste between vim and dekstop, but doesnt.

" Install vim-plug if not found

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Install Nvim-R for R IDE
Plug 'jalvesaq/Nvim-R'

" Install plugins for ncm-R

Plug 'ncm2/ncm2'
"Plug 'roxma/nvim-yarp'
Plug 'jalvesaq/Nvim-R'
Plug 'gaalcaras/ncm-R'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'arcticicestudio/nord-vim'
"Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'morhetz/gruvbox'
Plug 'tmux-plugins/vim-tmux-focus-events'

" Initialize plugin system
call plug#end()


"Set colorschemes:
"airline (bottom line)
"let g:airline_solarized_bg='dark'
"let g:airline_theme = 'material'

"let g:material_theme_style = 'default' | 'palenight' | 'ocean' | 'lighter' | 'darker' | 'default-community' | 'palenight-community' | 'ocean-community' | 'lighter-community' | 'darker-community'
"let g:material_theme_style = 'default'
"colorscheme material

" Settings for gruvbox theme
let g:airline_theme = 'gruvbox'
colorscheme gruvbox

" Settings for Nord theme
"colorscheme nord


" Vim 8 only
"if !has('nvim')
"    Plug 'roxma/vim-hug-neovim-rpc'
"endif

let R_assign_map = "£"




