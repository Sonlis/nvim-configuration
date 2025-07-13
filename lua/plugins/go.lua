local plugins = {
    {
        "olexsmir/gopher.nvim",
        ft = "go",
        build = function()
            vim.cmd.GoInstallDeps()
        end,
    }
}

return plugins
