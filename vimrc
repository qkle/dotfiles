" better safe than sorry :)
set nocompatible

" enable syntax and plugins (for netrw)
syntax enable
filetype plugin on

set bg=dark
set number
set cursorline

" enable hilight_search and increasing_search
set hlsearch
set incsearch

" https://www.reddit.com/r/vim/wiki/tabstop 
set tabstop=8
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
