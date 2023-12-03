

" ADDED by CLEMENS

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

"set clipboard^=unnamedplus " Supposed to help copy/paste between vim and dekstop, but doesnt.

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
let python_highlight_all=1

" Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" Switch between buffers 
map <leader>n :bnext<cr>
map <leader>N :bprevious<cr>
map <leader>d :bdelete<cr>

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

" Plugins to make using R easier:
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'gaalcaras/ncm-R'
Plug 'preservim/nerdtree'
Plug 'Raimondi/delimitMate'
Plug 'jalvesaq/Nvim-R'

" Python plugins 
Plug 'davidhalter/jedi-vim'
Plug 'vim-scripts/indentpython.vim'
Plug 'ivanov/vim-ipython'
" aesthetics
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'arcticicestudio/nord-vim'
Plug 'morhetz/gruvbox'

" Misc
Plug 'tmux-plugins/vim-tmux-focus-events'

" ncm2 dictionaries
Plug 'ncm2/ncm2-path'

" REPL
Plug 'jpalardy/vim-slime'

" Initialize plugin system
call plug#end()


"Set colorschemes:

" Settings for gruvbox theme
let g:airline_theme = 'gruvbox'
colorscheme gruvbox

" Settings for Nord theme
"colorscheme nord

" DISABLE THE VIRUS KITE
"KiteDisableAutoStart

""""""""""""""""""""
" Nvim-R settings  "
""""""""""""""""""""
" press -- to have Nvim-R insert the assignment operator: <-
let R_assign_map = "--"

" set a minimum source editor width
let R_min_editor_width = 80

" make sure the console is at the bottom by making it really wide
let R_rconsole_width = 1000

" show arguments for functions during omnicompletion
"let R_show_args = 1

" Don't expand a dataframe to show columns by default
let R_objbr_opendf = 0

" Press the space bar to send lines and selection to R console
vmap <Space> <Plug>RDSendSelection
nmap <Space> <Plug>RDSendLine

" NCM2
autocmd BufEnter * call ncm2#enable_for_buffer()    " To enable ncm2 for all buffers.
set completeopt=noinsert,menuone,noselect           " :help Ncm2PopupOpen for more
                                                    " information.
" NERD Tree
map <leader>nn :NERDTreeToggle<CR>                  " Toggle NERD tree.


