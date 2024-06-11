require("config.set")
require("config.remap")
require("config.autocmd")
require("config.lsp-commands")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    'camspiers/snap',
    {
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            require("config.plugins.rosepine_config")
        end
    },
    'nvim-treesitter/nvim-treesitter',
    'mbbill/undotree',
    'tpope/vim-fugitive',
    {
        'nvim-neo-tree/neo-tree.nvim',
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim"
        },
        config = function()
            require("config.plugins.neotree_config")
        end
    },
    {
        'altermo/ultimate-autopair.nvim',
        event = { 'InsertEnter', 'CmdlineEnter' },
        branch = "v0.6"
    }
})
