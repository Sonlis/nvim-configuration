return {
    'nvim-neo-tree/neo-tree.nvim',
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim"
    },
    config = function()
        require("neo-tree").setup({
            event_handlers = {
                {
                    event = "neo_tree_buffer_enter",
                    handler = function()
                        vim.opt_local.relativenumber = true
                    end,
                },
            },
            window = {
                width = 25,
                mappings = {
                    ["/"] = ""
                }
            }
        })
    end
}
