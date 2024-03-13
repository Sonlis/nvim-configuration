require("bastibast.set")
require("bastibast.remap")

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local ThePrimeagenGroup = augroup('ThePrimeagen', {})

local yank_group = augroup('HighlightYank', {})

local editor_startup = augroup('EditorStartup', {})

function R(name)
    require("plenary.reload").reload_module(name)
end

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

autocmd({"BufWritePre"}, {
    group = ThePrimeagenGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

autocmd({"VimEnter"}, {
    group = editor_startup,
    pattern = "*",
    command = [[Neotree]],
})
