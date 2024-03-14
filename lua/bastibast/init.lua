require("bastibast.set")
require("bastibast.remap")
require("bastibast.autocmd")

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- File finder --
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    -- Color theme --
    use({
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            require("bastibast.plugins.rosepine_config")
        end
    })
    -- Syntax tree --
    use({'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'})

    -- Undo tree --
    use('mbbill/undotree')

    -- Git integration --
    use('tpope/vim-fugitive')

    -- JSON prettifier --
    use('gennaro-tedesco/nvim-jqx')

    -- lsp and completion --
    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        }
    }
    use("github/copilot.vim")

    -- Zen mode --
    use("folke/zen-mode.nvim")

    -- Error debugger --
    use("folke/trouble.nvim")

    -- Harpoon, to move quickly between files --
    use {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        requires = { {"nvim-lua/plenary.nvim"} }
    }
    -- Directory tree --
    use 'nvim-tree/nvim-web-devicons'
    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim"
        },
        config = function()
            require("bastibast.plugins.neotree_config")
        end
    }
end)
