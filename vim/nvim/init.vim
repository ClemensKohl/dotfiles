set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

" Plugins

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Plugins to make using R easier:
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'gaalcaras/ncm-R'
Plug 'preservim/nerdtree'
Plug 'Raimondi/delimitMate'
Plug 'jalvesaq/Nvim-R'

" Python plugins 
Plug 'davidhalter/jedi-vim'
"Plug 'vim-scripts/indentpython.vim'
Plug 'ivanov/vim-ipython'

" Writing Plugins
Plug 'folke/zen-mode.nvim' 

" ncm2 dictionaries
Plug 'ncm2/ncm2-path'

" Initialize plugin system
call plug#end()

""""""""""""""""""""
" Nvim-R settings  "
""""""""""""""""""""
" press -- to have Nvim-R insert the assignment operator: <-
let R_assign_map = "--"

" set a minimum source editor width
let R_min_editor_width = 80

" make sure the console is at the bottom by making it really wide
"let R_rconsole_width = 1000
let R_rconsole_width = 80

" show arguments for functions during omnicompletion
let R_show_args = 1

" Don't expand a dataframe to show columns by default
"let R_objbr_opendf = 0

" Press the space bar to send lines and selection to R console
vmap <Space> <Plug>RDSendSelection
nmap <Space> <Plug>RDSendLine

" NCM2
autocmd BufEnter * call ncm2#enable_for_buffer()    " To enable ncm2 for all buffers.
set completeopt=noinsert,menuone,noselect           " :help Ncm2PopupOpen for more
                                                    " information.
" NERD Tree
map <leader>nn :NERDTreeToggle<CR>                  " Toggle NERD tree.
