
syntax on
set background=dark
set mouse=  " disables the mouse

set number
set showmatch " Shows matching brackets
set ruler " Always shows location in file (line#)
set smarttab " Autotabs for certain code
set ts=4 sw=4 " Sets the tabs to 4 spaces.
set backspace=indent,eol,start
set encoding=utf8

" Python indentation
au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ softtabstop=4
    \ shiftwidth=4
    \ textwidth=79
    \ expandtab
    \ autoindent
    \ fileformat=unix

" Basiclet python_highlight_all=1 settings
"let python_highlight_all=1
"let python_highlight_space_errors = 0

" " Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" Switch between buffers 
map <leader>b :bnext<cr>
map <leader>B :bprevious<cr>
map <leader>d :bdelete<cr>

" Move between splits
" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

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

" aesthetics
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'

" Misc
Plug 'tmux-plugins/vim-tmux-focus-events'

" Initialize plugin system
call plug#end()


"Set colorschemes:

" Settings for gruvbox theme
let g:airline_theme = 'gruvbox'
colorscheme gruvbox

" Python setting
let g:python_highlight_space_errors = 0

