return {
    cmd = { "pylsp" },
    filetypes = { "python" },
    settings = {
        pylsp = {
            plugins = {
                pycodestyle = {
                    ignore = { 'E501' }
                },
                pylint = {
                    enabled = true,
                    args = {
                        "--runtime-typing=true"
                    }
                }
            }
        }
    }
}
