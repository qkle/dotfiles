-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
-- For more options, you can see `:help option-list`

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
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Understand tab "default" configuration behavior
-- https://www.reddit.com/r/vim/wiki/tabstop
-- http://vimcasts.org/episodes/tabs-and-spaces/
-- Keep tabstop = softtabstop = shiftwidth for most convenient and consistent
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

-- Every wrapped line will continue visually indented to preserve horizontal blocks of text.
vim.opt.breakindent = true

-- Save undo history
-- vim.opt.undofile = true

-- Keep signcolumn on by default
-- vim.opt.signcolumn = 'yes'

-- Preview substitutions live, as you type!
-- vim.opt.inccommand = 'split'

-- Minimal number of screen lines to keep above and below the cursor
-- vim.opt.scrolloff = 10

-- If performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
-- vim.opt.confirm = true


