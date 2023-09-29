

" ADDED by CLEMENS

syntax on
set background=dark
"color desert

" set number
set backspace=indent,eol,start


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
"Plug 'AlexvZyl/nordic.nvim', { 'branch': 'main' }
"Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'morhetz/gruvbox'


" Initialize plugin system
call plug#end()


"Set colorschemes:
"airline (bottom line)
"let g:airline_solarized_bg='dark'
"let g:airline_theme = 'material'
let g:airline_theme = 'gruvbox'

"let g:material_theme_style = 'default' | 'palenight' | 'ocean' | 'lighter' | 'darker' | 'default-community' | 'palenight-community' | 'ocean-community' | 'lighter-community' | 'darker-community'
"let g:material_theme_style = 'default'
"colorscheme material
colorscheme gruvbox

" Vim 8 only
"if !has('nvim')
"    Plug 'roxma/vim-hug-neovim-rpc'
"endif

" Nvim-R extra settings
"" Change assignment operator
let R_assign_map = "@"





