require("autocmd")
require("remap")
require("set")
require("lsp")
require("filetypes")

vim.lsp.enable({ "bashls", "clangd", "gopls", "jinja", "jsonlsp", "lua_ls", "nil", "ruff", "rust_analyzer",
    "ty", "vue",
    "vtsls",
    "terraform_ls", "yamlls" })

require('vim._core.ui2').enable({})
