vim.filetype.add({
    extension = {
        gotmpl = 'gotmpl',
    },
    pattern = {
        [".*/templates/.*%.tpl"] = "helm",
        [".*/templates/.*%.ya?ml"] = "helm",
        ["helmfile.*%.ya?ml"] = "helm",
    },
})

vim.filetype.add({
    extension = {
        j2 = 'jinja',
        jinja = 'jinja',
        jinja2 = 'jinja',
    },
})
