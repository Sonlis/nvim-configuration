# Highly influenced by https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/util.lua
local vim = vim
local uv = vim.uv
local is_windows = uv.os_uname().version:match 'Windows'
local validate = vim.validate
local nvim_eleven = vim.fn.has 'nvim-0.11' == 1
local M = {}

M.path = (function()
    local function dirname(path)
        local strip_dir_pat = '/([^/]+)$'
        local strip_sep_pat = '/$'
        if not path or #path == 0 then
            return path
        end
        local result = path:gsub(strip_sep_pat, ''):gsub(strip_dir_pat, '')
        if #result == 0 then
            if is_windows then
                return path:sub(1, 2):upper()
            else
                return '/'
            end
        end
        return result
    end

    local function escape_wildcards(path)
        return path:gsub('([%[%]%?%*])', '\\%1')
    end

    --- @param filename string
    --- @return string|false
    local function exists(filename)
        local stat = uv.fs_stat(filename)
        return stat and stat.type or false
    end

    --- @param filename string
    --- @return boolean
    local function is_dir(filename)
        return exists(filename) == 'directory'
    end

    --- @param filename string
    --- @return boolean
    local function is_file(filename)
        return exists(filename) == 'file'
    end

    --- @param path string
    --- @return boolean
    local function is_fs_root(path)
        if is_windows then
            return path:match '^%a:$'
        else
            return path == '/'
        end
    end

    -- Iterate the path until we find the rootdir.
    local function iterate_parents(path)
        local function it(_, v)
            if v and not is_fs_root(v) then
                v = dirname(v)
            else
                return
            end
            if v and uv.fs_realpath(v) then
                return v, path
            else
                return
            end
        end
        return it, path, path
    end

    local function path_join(...)
        return table.concat(M.tbl_flatten { ... }, '/')
    end


    return {
        escape_wildcards = escape_wildcards,
        is_dir = is_dir,
        is_file = is_file,
        is_fs_root = is_fs_root,
        iterate_parents = iterate_parents,
        join = path_join
    }
end)()

function M.search_ancestors(startpath, func)
    validate { func = { func, 'f' } }
    if func(startpath) then
        return startpath
    end
    local guard = 100
    for path in M.path.iterate_parents(startpath) do
        -- Prevent infinite recursion if our algorithm breaks
        guard = guard - 1
        if guard == 0 then
            return
        end

        if func(path) then
            return path
        end
    end
end

function M.find_git_ancestor(startpath)
    return M.search_ancestors(startpath, function(path)
        -- Support git directories and git files (worktrees)
        if M.path.is_dir(M.path.join(path, '.git')) or M.path.is_file(M.path.join(path, '.git')) then
            return path
        end
    end)
end

function M.tbl_flatten(t)
    return nvim_eleven and vim.iter(t):flatten(math.huge):totable() or vim.tbl_flatten(t)
end

return M
