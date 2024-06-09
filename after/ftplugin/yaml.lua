local util = require("after.ftplugin.utils")
local root_dir = util.find_git_ancestor(vim.fn.getcwd())
if root_dir then
    vim.lsp.start({
        cmd = { 'yaml-language-server', '--stdio' },
        root_dir = root_dir,
        settings = {
            yaml = {
                validate = true,
                format = {
                    enable = true,
                    singleQuota = true,
                    printWidth = 120
                },
                schemaStore = {
                    url = "https://www.schemastore.org/api/json/catalog.json",
                    enable = true
                }
            }
        }
    })
end
