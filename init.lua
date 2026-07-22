require("autocmd")
require("remap")
require("set")
require("lsp")
require("filetypes")

vim.lsp.enable({ "bashls", "clangd", "gopls", "jinja", "jsonlsp", "lua_ls", "marksman", "nil", "ruff", "rust_analyzer",
  "zuban", "vue",
  "vtsls",
  "terraform_ls", "yamlls" })

require('vim._core.ui2').enable({})
