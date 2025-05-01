-- See `:help vim.opt`
-- For more options, you can see `:help option-list`

-- Enable 24-bit RGB color in the TUI for colorscheme to work properly in tmux
-- in Windows Terminal
vim.opt.termguicolors = true

-- Make line numbers default
vim.opt.number = true
vim.opt.relativenumber = true

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Highlight the screen column 80 to align text at max 79 characters per line
vim.opt.colorcolumn = "80"

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Case-insensitive searching UNLESS \C or capital letter(s) in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Set how neovim will display certain whitespace characters in the editor
-- See `:help 'list'`
-- and `:help 'listchars'`
vim.opt.list = true
-- vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Understand tab "default" configuration behavior
-- https://www.reddit.com/r/vim/wiki/tabstop
-- http://vimcasts.org/episodes/tabs-and-spaces/
-- Keep tabstop = softtabstop = shiftwidth for most convenient and consistent
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

-- Wrapped lines are visually indented to preserve horizontal blocks of text
vim.opt.breakindent = true

-- Save undo history
-- vim.opt.undofile = true

-- Keep signcolumn on by default
-- vim.opt.signcolumn = 'yes'

-- Sync clipboard between OS and Neovim.
-- Schedule the setting after `UiEnter` because it can increase startup-time.
-- Remove this option if you want your OS clipboard to remain independent.
-- See `:help 'clipboard'`
vim.schedule(function()
    vim.opt.clipboard = 'unnamedplus'
end)
