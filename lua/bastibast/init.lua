require("bastibast.set")
require("bastibast.remap")

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local yank_group = augroup('HighlightYank', {})

local editor_startup = augroup('EditorStartup', {})

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

autocmd({"VimEnter"}, {
    group = editor_startup,
    command = [[Neotree toggle current reveal_force_cwd]],
})
