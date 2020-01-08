" =============================================================================
" vim-plug Plugin Manager
" =============================================================================
" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" Declare the list of plugins. Make sure you use single quotes
" -----------------------------------------------------------------------------
" General
" -----------------------------------------------------------------------------
Plug 'christoomey/vim-tmux-navigator'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Townk/vim-autoclose'
Plug 'tpope/vim-commentary'

" -----------------------------------------------------------------------------
" Appearance
" -----------------------------------------------------------------------------
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'

" Initialize plugin system. Plugins become visible to Vim after this call
call plug#end()

" -----------------------------------------------------------------------------
" Docs
" -----------------------------------------------------------------------------
" Reload .vimrc file (:source ~/.vimrc) or restart Vim
" Run :PlugInstall to install the plugins
" Essential commands:
"	- PlugInstall		Install plugins
"	- PlugUpdate		Install or update plugins
"	- PlugClean			Remove unlisted plugins
"	- PlugUpgrade		Upgrade vim-plug itself
"	- PlugStatus		Check the status of plugins
" =============================================================================


" =============================================================================
" Plugins Config
" =============================================================================
" -----------------------------------------------------------------------------
" NERDTree
" -----------------------------------------------------------------------------
" Map key for toggling nerdtree
map <C-n> :NERDTreeToggle<CR>

" Close vim if the only window left open is a nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" -----------------------------------------------------------------------------
" vim-airline
" -----------------------------------------------------------------------------
" Select theme from
" https://github.com/vim-airline/vim-airline/wiki/Screenshots
" Favourite themes:
"	- minimalist
"	- peaksea
"	- seagull
"	- distinguished
"	- ravenpower
let g:airline_theme='minimalist'

" Enable powerline fonts in vim-airline
" Need to install powerline-fonts https://github.com/powerline/fonts
let g:airline_powerline_fonts = 1

" Automatically displays all buffers when there's only one tab open
let g:airline#extensions#tabline#enabled = 1

" Show buffer number in the tab line
let g:airline#extensions#tabline#buffer_nr_show = 1
" =============================================================================


" =============================================================================
" Basic Configuration
" =============================================================================
" better safe than sorry :)
set nocompatible

" enable syntax and plugins (for netrw)
syntax enable
filetype plugin on

" Select color scheme and set to dark mode
colorscheme gruvbox
set bg=dark

" Highlight the screen line of the cursor to easily spot the cursor
set cursorline

" Hightlight the screen column 80 to align text at max 79 characters per line
set colorcolumn=80
highlight ColorColumn ctermbg=Yellow guibg=Yellow

" Automatic toggling between line number modes
" https://jeffkreeftmeijer.com/vim-number/
set number relativenumber

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * set norelativenumber
augroup END

" enable hilight_search and increasing_search
set hlsearch
set incsearch

" https://www.reddit.com/r/vim/wiki/tabstop
" http://vimcasts.org/episodes/tabs-and-spaces/
" Keep tabstop = softtabstop = shiftwidth for most convinient and consistent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab

" Copy indent from current line when starting a new line
set autoindent

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Automatically rebalance windows on vim resize for using with tmux splits
autocmd VimResized * :wincmd =
" =============================================================================


" =============================================================================
" Key bindings & mapping
" =============================================================================
" Easier moving of code blocks
vnoremap < <gv
vnoremap > >gv
" =============================================================================


" =============================================================================
" Local settings for editing different filetypes
" =============================================================================
" gitcommit
autocmd FileType gitcommit setlocal textwidth=72
autocmd FileType gitcommit setlocal colorcolumn=51,73

" P4 source code
autocmd FileType p4 setlocal cindent
autocmd FileType p4 setlocal cino=(0
autocmd FileType p4 setlocal commentstring=//\ %s
" =============================================================================
