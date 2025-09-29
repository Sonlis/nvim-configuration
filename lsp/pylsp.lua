return {
    cmd = { "pylsp" },
    filetypes = { "python" },
    root_markers = {
        'pyproject.toml',
        'setup.py',
        'setup.cfg',
        'requirements.txt',
        'Pipfile',
        '.git',
    },
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
