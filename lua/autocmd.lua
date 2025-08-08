local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local yank_group = augroup('HighlightYank', {})

local editor_startup = augroup('EditorStartup', {})

-- Neat little trick to open neotree on startup:
-- If we open giving a directory or no arguments, opens neotree in a way that it remains on the left
-- but remove the additional window that is created, so we have a complete view of the folder.
-- If a file is given as argument, open it and focus on the file window, while having the neotree window on the left.
autocmd({"VimEnter"}, {
    group = editor_startup,
    callback = function()
        local entrypoint = vim.fn.expand('<afile>')
        if vim.fn.isdirectory(entrypoint) == 1 or vim.fn.expand(entrypoint) == "" then
            vim.cmd('Neotree reveal_force_cwd toggle left')
            -- vim.api.nvim_win_close(1000, true)
        else
            vim.cmd('Neotree reveal_force_cwd toggle left')
            vim.api.nvim_set_current_win(1000)
        end
        vim.cmd.colorscheme("catppuccin-mocha")
    end,
})

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

vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(event)
        local bufmap = function(mode, lhs, rhs)
            local opts = { buffer = event.buf }
            vim.keymap.set(mode, lhs, rhs, opts)
        end

        -- You can find details of these function in the help page
        -- see for example, :help vim.lsp.buf.hover()

        -- Trigger code completion
        bufmap('i', '<C-Space>', '<C-x><C-o>')

        -- Display documentation of the symbol under the cursor
        bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')

        -- Jump to the definition
        bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')

        -- Jump to declaration
        bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')

        -- Lists all the implementations for the symbol under the cursor
        bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')

        -- Jumps to the definition of the type symbol
        bufmap('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')

        -- Lists all the references
        bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')

        -- Displays a function's signature information
        bufmap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>')

        -- Renames all references to the symbol under the cursor
        bufmap('n', '<gR>', '<cmd>lua vim.lsp.buf.rename()<cr>')

        -- Format current file
        bufmap('n', '<gF>', '<cmd>lua vim.lsp.buf.format()<cr>')

        -- Selects a code action available at the current cursor position
        bufmap('n', '<C-å>', '<cmd>lua vim.lsp.buf.code_action()<cr>')
    end
})

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end
  end,
})
