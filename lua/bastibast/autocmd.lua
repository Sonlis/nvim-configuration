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

-- Neat little trick to open neotree on startup:
-- If we open giving a directory or no arguments, opens neotree in a way that it remains on the left
-- but remove the additional window that is created, so we have a complete view of the folder.
-- If a file is given as argument, open it and focus on the file window, while having the neotree window on the left.
autocmd({"VimEnter"}, {
    group = editor_startup,
    callback = function()
        if vim.fn.isdirectory(vim.fn.expand('<afile>')) == 1 or vim.fn.expand('<afile>') == "" then
            vim.cmd([[Neotree toggle left reveal_force_cwd]])
            vim.api.nvim_win_close(1000, true)
        else
            vim.cmd([[Neotree toggle left reveal]])
            vim.api.nvim_set_current_win(1000)
        end
    end,
})
