" better safe than sorry :)
set nocompatible

" enable syntax and plugins (for netrw)
syntax enable
filetype plugin on

set bg=dark
set cursorline

" Set ColorColumn=80 for aligning text at max 79 characters
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

set autoindent

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Automatically rebalance windows on vim resize for using with tmux splits
autocmd VimResized * :wincmd =

" FINDING FILES:

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

" NOW WE CAN:
" - Hit tab to: find by partial match
" - Use * to make it fuzzy


" THINGS TO CONSIDER:
" - :b lets you autocomplete any open buffer


" AUTOMATIC CLOSING BRACKET:
""inoremap " ""<left>
""inoremap ' ''<left>
""inoremap ( ()<left>
""inoremap [ []<left>
""inoremap { {}<left>
""inoremap {<CR> {<CR><CR>}<Esc>ki<Tab>

" Easier moving of code blocks
vnoremap < <gv
vnoremap > >gv


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""" VIM-PLUG """""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
Plug 'christoomey/vim-tmux-navigator'
Plug 'scrooloose/nerdtree'
Plug 'Townk/vim-autoclose'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'

" Initialize plugin system
call plug#end()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""" PLUGIN CONFIG TEMPLATE """""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""" NERDTREE CONFIG """"""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MAP KEY FOR TOGGLING NERDTREE:
map <C-n> :NERDTreeToggle<CR>

" CLOSE VIM IF THE ONLY WINDOW LEFT OPEN IS A NERDTREE:
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""" NERDCOMMENTER CONFIG """""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Align comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""" VIM-AIRLINE CONFIG """""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


colorscheme gruvbox
