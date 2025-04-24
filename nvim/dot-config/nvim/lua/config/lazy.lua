-- See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info

-- Structured Setup
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

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
-- vim.g.mapleader = " "
-- vim.g.maplocalleader = "\\"

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
-- List of plugins from kickstart.nvim
-- tpope/vim-sleuth,
-- lewis6991/gittsigns.nvim,
-- folke/which-key.nvim,
-- nvim-telescope/telescope.nvim,
--      nvim-luaplenary.nvim,
--      nvim-telescope/telescope-fzf-native.nvim,
--      nvim-telescope/telescope-ui-select.nvim,
--      nvim-tree/nvim-web-devicons,
-- folke/lazydev.nvim,
-- neovim/nvim-lspconfig,
--      williamboman/mason.nvim,
--      williamboman/mason-lspconfig.nvim,
--      WhoIsSethDaniel/mason-tool-installer.nvim,
--      j-hui/fidget.nvim,
--      saghen/blink.cmp,
-- stevearc/conform.nvim,
-- saghenblink.cmp,
--      L3MON4D3/LuaSnip,
-- folke/tokyonight.nvim,
-- folke/todo-comments.nvim,
-- echasnovski/mini.nvim,
-- nvim-treesitter/nvim-treesitter,

-- Setup lazy.nvim
require("lazy").setup({
    -- spec = {
    --     -- import your plugins
    --     -- { import = "plugins" },
    -- },
    -- -- Configure any other settings here. See the documentation for more details.
    -- -- colorscheme that will be used when installing plugins.
    -- install = { colorscheme = { "habamax" } },
    -- -- automatically check for plugin updates
    -- checker = { enabled = true },

   {
        "folke/which-key.nvim",
        enabled = true,
        event = "VeryLazy",
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
        keys = {
            {
                "<leader>?",
                function()
                    require("which-key").show({ global = false })
                end,
                desc = "Buffer Local Keymaps (which-key)",
            },
        },
    },

    {
        "christoomey/vim-tmux-navigator",
        cmd = {
            "TmuxNavigateLeft",
            "TmuxNavigateDown",
            "TmuxNavigateUp",
            "TmuxNavigateRight",
            "TmuxNavigatePrevious",
            "TmuxNavigatorProcessList",
        },
        keys = {
            { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
            { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
            { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
            { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
            { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
        },
    },

})
