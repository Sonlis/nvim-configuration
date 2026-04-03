vim.pack.add({
    'https://github.com/mbbill/undotree',
    'https://github.com/tpope/vim-fugitive',
    'https://github.com/altermo/ultimate-autopair.nvim',
    'https://github.com/christoomey/vim-tmux-navigator'
})


vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

require('ultimate-autopair').setup()
