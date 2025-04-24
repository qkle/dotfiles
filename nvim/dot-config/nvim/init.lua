-- Set <space> as the leader key
-- See `:help mapleader`
-- NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
-- vim.g.mapleader = ' '
-- vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
-- vim.g.have_nerd_font = false

-------------------------------------------------------------------------------
-- [[ Options ]]
require("config.options")
-------------------------------------------------------------------------------
-- [[ Keymaps ]]
require("config.keymaps")
-------------------------------------------------------------------------------
-- [[ Autocmds ]]
require("config.autocmds")
-------------------------------------------------------------------------------
-- [[ Install `lazy.nvim` plugin manager ]]
-- [[ Configure and install plugins ]]
require("config.lazy")
