local root_files = { ".git" }
local paths = vim.fs.find(root_files, {stop = vim.env.HOME})
local root_dir = vim.fs.dirname(paths[1])

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
