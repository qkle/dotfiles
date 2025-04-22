-- Set <space> as the leader key
-- See `:help mapleader`
-- NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
-- vim.g.mapleader = ' '
-- vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
-- vim.g.have_nerd_font = false

-------------------------------------------------------------------------------
-- [[ Settings options ]]
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

-------------------------------------------------------------------------------
-- [[ Basic Keymaps ]]
-- See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
-- See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Easier moving of code blocks
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
-- vim.keymap.set('t', '<Esc><Esc>', '<C-\><C-n>, { desc = 'Exit terminal mode' })

-------------------------------------------------------------------------------
-- [[ Basic Autocommands ]]
-- See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
-- Try it with `yap` in normal mode
-- See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-------------------------------------------------------------------------------
-- [[ Install `lazy.nvim` plugin manager ]]
-- See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info

-- Single File Setup
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
--
-- To check the current status of your plugins, run
-- :Lazy
--
-- You can press `?` in this menu for help. Use `:q` to close the window
--
-- To update plugins you can run
-- :Lazy update
--
-- NOTE: Here is where you install your plugins.
require("lazy").setup({
        -- NOTE: Plugins can be added with a link (or for a github repo: `owner/repo' link).
        -- 'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
})

        -- NOTE: Plugins can also be added by using a table,
        -- with the first argument being the link and the following
        -- keys can be used to configure plugin behavior/loading/etc.
        --
        -- Use `opts = {}` to automatically pass options to a plugin's `setup()` function, forcing the plugin to be loaded.
        --

        -- Alternatively, use `config = function() ... end` for full control over the configuration.
        -- If you prefer to call `setup` explicitly, use:
        -- {
        --      'lewis6991/gitsigns.nvim',
        --      config = function()
        --              require('gitsigns').setup({
        --                      -- Your gitsigns configuration herer
        --              })
        --      end,
        -- }
        --
        -- Here is a more advanced exmple where we pass configuration
        -- options to `gitsigns.nvim`.
        --
        -- See `:help gitsigns` to understand what the configuration keys do
        -- { -- Adds git related signs to the gutter, as well as utilities for managing changes
        --      'lewis6991/gitsigns.nvim',
        --      opts = {
        --              signs = {
        --                      add = { text = '+' },
        --                      change = { text = '~' },
        --                      delete = { text = '_' },
        --                      topdelete = { text = '-' },
        --                      changedelete = { text = '~' },
        --              },
        --      },
        -- },

        -- NOTE: Plugins can also be configured to run Lua code when they are loaded.
        --
        -- This is often very useful to both group configuration, as well as handle
        -- lazy loading plugins that don't need to be loaded immediately at startup.
        --
        -- For example, in the following configuration, we use:
        -- event = 'VimEnter'
        --
        -- which loads which-key before all the UI elements are loaded. Events can be
        -- normal autocommands events (`:help autocmd-events`).
        --
        -- Then, because we use the `opts` key (recommended), the configuration runs
        -- after the plugin has been loaded as `require(MODULE).setup(opts)`.

        -- { -- Useful plugin to show you pending keybinds.
        --      'folke/which-key.nvim',
        --      event = 'VimEnter', -- Sets the loading event to 'VimEnter'
        --      opts = {
        --              -- delay between pressing a key and opening which-key (milliseconds)
        --              -- this setting is independent of vim.opt.timeoutlen
        --              delay = 0,
        --              icons = {
        --                      -- set icon mappings to true if you have a Nerd Font
        --                      mappings = vim.g.have_nerd_font,
        --                      -- If you are using a Nerd Font: set icons.keys to an empty table which will use the
        --                      -- default which-key.nvim defined Nerd Font icons, otherwise define a string table
        --                      keys = vim.g.have_nerd_font and {} or {
        --                              Up = '<Up> ',
        --                              Down = '<Down> ',
        --                              Left = '<Left> ',
        --                              Right = '<Right> ',
        --                              C = '<C-…> ',
        --                              M = '<M-…> ',
        --                              D = '<D-…> ',
        --                              S = '<S-…> ',
        --                              CR = '<CR> ',
        --                              Esc = '<Esc> ',
        --                              ScrollWheelDown = '<ScrollWheelDown> ',
        --                              ScrollWheelUp = '<ScrollWheelUp> ',
        --                              NL = '<NL> ',
        --                              BS = '<BS> ',
        --                              Space = '<Space> ',
        --                              Tab = '<Tab> ',
        --                              F1 = '<F1>',
        --                              F2 = '<F2>',
        --                              F3 = '<F3>',
        --                              F4 = '<F4>',
        --                              F5 = '<F5>',
        --                              F6 = '<F6>',
        --                              F7 = '<F7>',
        --                              F8 = '<F8>',
        --                              F9 = '<F9>',
        --                              F10 = '<F10>',
        --                              F11 = '<F11>',
        --                              F12 = '<F12>',
        --                      },
        --              },

                        -- Document existing key chains
        --              spec = {
        --                      { '<leader>s', group = '[S]earch' },
        --                      { '<leader>t', group = '[T]oggle' },
        --                      { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
        --              },
        --      },
        -- },

        -- NOTE: Plugins can specify dependencies.
        --
        -- The dependencies are proper plugin specifications as well - anything
        -- you do for a plugin at the top level, you can do for a dependency.
        --
        -- Use the `dependencies` key to specify the dependencies of a particular plugin

--      { -- Fuzzy Finder (files, lsp, etc)
--              'nvim-telescope/telescope.nvim',
--              event = 'VimEnter',
--              dependencies = {
--                      'nvim-lua/plenary.nvim',
--                      { -- If encountering errors, see telescope-fzf-native README for installation instructions
--                              'nvim-telescope/telescope-fzf-native.nvim',
--
--                              -- `build` is used to run some command when the plugin is installed/updated.
--                              -- This is only run then, not every time neovim starts up.
--                              build = 'make',
--
--                              -- `cond` is a condition used to determine whether this plugin should be
--                              -- installed and loaded.
--                              cond = function()
--                                      return vim.fn.executable 'make' == 1
--                              end,
--                      },
--                      { 'nvim-telescope/telescope-ui-select.nvim' },
--
--                      -- Useful for getting pretty icons, but requires a Nerd Font.
--                      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
--              },
--              config = function()
--                      -- Telescope is a fuzzy finder that comes with a lot of different things that
--                      -- it can fuzzy find! It's more than just a "file finder", it can search
--                      -- many different aspects of Neovim, your workspace, LSP, and more!
--                      --
--                      -- The easiest way to use Telescope, is to start by doing something like:
--                      -- :Telescope help_tags
--                      --
--                      -- After running this command, a window will open up and you're able to
--                      -- type in the prompt window. You'll see a list of `help_tags` options and
--                      -- a corresponding preview of the help.
--                      --
--                      -- Two important keymaps to use while in Telescope are:
--                      --      - Insert mode: <C-/>
--                      --      - Normal mode: ?
--                      --      
--                      -- This opens a window that shows you all of the keymaps for the current
--                      -- Telescope picker. This is really useful to discover what Telescope can
--                      -- do as well as how to actually do it!
--
--                      -- [[ Configure Telescope ]]
--                      -- See `:help telescope` and `:help telescope.setup()`
--                      require('telescope').setup {
--                              -- You can put your default mappings / updates / etc. in here
--                              -- All the info you're looking for is in `:help telescope.setup()`
--                              --
--                              -- defaults = {
--                              --      mappings = {
--      spec = {
--              -- add your plugins here
--      },
--      -- Configure any other settings here. See the documentation for more details.
--      -- colorscheme that will be used when installing plugins.
--      install = { colorscheme = { "habamax" } },
--      -- automatically check for plugin updates
--      checker = { enabled = true },
-- })
