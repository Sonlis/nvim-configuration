require("autocmd")
require("remap")
require("set")
require("lsp")

vim.lsp.enable({ "bashls", "clangd", "gopls", "jsonlsp", "lua_ls", "nil", "ruff", "rust_analyzer", "ty", "vue", "vtsls",
    "terraform_ls", "yamlls" })

require('vim._core.ui2').enable({})
