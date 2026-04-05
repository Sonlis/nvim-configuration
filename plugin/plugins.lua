vim.pack.add({
    'https://github.com/tpope/vim-fugitive',
    'https://github.com/altermo/ultimate-autopair.nvim',
    'https://github.com/christoomey/vim-tmux-navigator'
})


vim.cmd "packadd nvim.undotree"
vim.keymap.set("n", "<leader>u", vim.cmd.Undotree)

require('ultimate-autopair').setup()
