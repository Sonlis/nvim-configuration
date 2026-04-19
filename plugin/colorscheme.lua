vim.pack.add({ { src = "https://github.com/catppuccin/nvim", name = "catppuccin" } })

require('catppuccin').setup({
    transparent_background = false
})

vim.pack.add({ { src = "https://github.com/rose-pine/neovim", name = "rose-pine" } })
require("rose-pine").setup({
    styles = {
        bold = true,
        italic = true,
        transparency = true,
    },
})

vim.cmd.colorscheme "rose-pine"
