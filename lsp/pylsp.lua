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
                ruff = {
                    enabled = true,
                },
                pylint = {
                    enabled = true,

                },
                flake8 = {
                    enabled = false
                }
            }
        }
    }
}
