" better safe than sorry :)
set nocompatible

" enable syntax and plugins (for netrw)
syntax enable
filetype plugin on


set bg=dark
set cursorline

" Set ColorColumn=80 for aligning text at max 79 characters
set colorcolumn=80
highlight ColorColumn ctermbg=Gray guibg=Gray

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
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR><CR>}<Esc>ki<Tab>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"""""""""""""""""""""""""""""""""" VIM-PLUG """""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
Plug 'christoomey/vim-tmux-navigator'

" Initialize plugin system
call plug#end()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
