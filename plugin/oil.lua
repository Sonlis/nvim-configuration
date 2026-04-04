vim.pack.add({ 'https://github.com/stevearc/oil.nvim', 'https://github.com/refractalize/oil-git-status.nvim',
    "https://github.com/nvim-mini/mini.icons" })


require('oil').setup({
    default_file_explorer = true,
    win_options = {
        signcolumn = "yes:2"
    },
    keymaps = {
        ["<C-l>"] = false,
        ["<C-h>"] = false,
    },
    -- Optional dependencies
    dependencies = { { "nvim-mini/mini.icons", opts = {} } },
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false
})

require('oil-git-status').setup()
require('mini.icons').setup()
