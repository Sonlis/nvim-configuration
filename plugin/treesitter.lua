vim.pack.add({ { src = "https://github.com/neovim-treesitter/nvim-treesitter", version = "main" } })

local languages = { "rust", "nix", "python", "typescript", "yaml", "go", "json" }

require('nvim-treesitter').install(languages)

vim.api.nvim_create_autocmd('FileType', {
    pattern = languages,
    callback = function()
        vim.treesitter.start()                                            -- highlighting
        vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'               -- folds
        vim.wo.foldmethod = 'expr'
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()" -- indentation
    end,
})

vim.api.nvim_create_autocmd('PackChanged', {
    callback = function(ev)
        local name, kind = ev.data.spec.name, ev.data.kind
        if name == 'nvim-treesitter' and kind == 'update' then
            if not ev.data.active then vim.cmd.packadd('nvim-treesitter') end
            vim.cmd('TSUpdate')
        end
    end
})
