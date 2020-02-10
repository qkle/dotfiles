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
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'dense-analysis/ale'
Plug 'junegunn/vim-easy-align'
Plug 'easymotion/vim-easymotion'

" -----------------------------------------------------------------------------
" FZF 
" -----------------------------------------------------------------------------
" PlugInstall & PlugUpdate will clone fzf in ~/.fzf and run the install script
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" -----------------------------------------------------------------------------
" Appearance
" -----------------------------------------------------------------------------
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" -----------------------------------------------------------------------------
" Markdown Editing
" -----------------------------------------------------------------------------
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

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
" FZF
" -----------------------------------------------------------------------------
set rtp+=~/.fzf

" -----------------------------------------------------------------------------
" NERDTree
" -----------------------------------------------------------------------------
" Map key for toggling nerdtree
map <C-n> :NERDTreeToggle<CR>

" Close vim if the only window left open is a nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" -----------------------------------------------------------------------------
" vim-easy-align
" -----------------------------------------------------------------------------
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

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
" -----------------------------------------------------------------------------
" CoC
" -----------------------------------------------------------------------------
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
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
