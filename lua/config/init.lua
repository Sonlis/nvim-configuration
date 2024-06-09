require("config.set")
require("config.remap")
require("config.autocmd")
require("config.lsp-commands")

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- File finder --
    use {
        'camspiers/snap'
    }
    -- Color theme --
    use({
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            require("config.plugins.rosepine_config")
        end
    })
    -- Syntax tree --
    use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })

    -- Undo tree --
    use('mbbill/undotree')

    -- Git integration --
    use('tpope/vim-fugitive')

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
            require("config.plugins.neotree_config")
        end
    }
    use {
    'altermo/ultimate-autopair.nvim',
    event={'InsertEnter','CmdlineEnter'},
    branch='v0.6', --recommended as each new version will have breaking changes
    config=function ()
        require('ultimate-autopair').setup({
                --Config goes here
                })
    end,
}
end)
