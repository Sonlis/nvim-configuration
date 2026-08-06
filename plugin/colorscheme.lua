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


vim.pack.add({ { src = "https://github.com/gbprod/nord.nvim", name = "nord" } })
vim.pack.add({ { src = "https://github.com/folke/tokyonight.nvim", name = "tokyonight" } })
vim.pack.add { "https://github.com/neanias/everforest-nvim" }
require("everforest").setup({
  transparent_background_level = 1
})
vim.cmd.colorscheme "rose-pine-main"
