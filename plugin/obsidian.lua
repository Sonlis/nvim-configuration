vim.pack.add {
    {
        src = "https://github.com/obsidian-nvim/obsidian.nvim",
        version = vim.version.range "*", -- use latest release, remove to use latest commit
    },
}

require("obsidian").setup {
    legacy_commands = false, -- this will be removed in 4.0.0
    workspaces = {
        {
            name = "personal",
            path = "~/vaults/personal",
        },
        {
            name = "work",
            path = "~/vaults/work",
        },
    },
}
