return {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate", -- This is not for typescript as I thought: https://github.com/nvim-treesitter/nvim-treesitter?tab=readme-ov-file#installation
                         -- Yes, I once removed it thinking it was for TS and yes, it did cause problems :D
    branch = "master",
    opts = {
        sync_install = false,
        auto_install = true,
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = { "terraform" }
        }
    },
    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
    end
}
