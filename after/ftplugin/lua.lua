local root_files = {'.git'}
local paths = vim.fs.find(root_files, {stop = vim.env.HOME})
local root_dir = vim.fs.dirname(paths[1])

if root_dir then
  vim.lsp.start({
    cmd = {'lua-language-server'},
    root_dir = root_dir,
  })
end
