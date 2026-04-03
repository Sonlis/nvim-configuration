---@type vim.lsp.Config
return {
    cmd = { "yaml-language-server", "--stdio" },
    filetypes = { "yaml" },
    root_markers = { ".git" },
    settings = {
        redhat = {
            telemetry = {
                enable = false
            },
        },
        yaml = {
            validate = true,
            format = {
                enable = true,
            },
            schemas = {
                ["https://production-green.pages.infomaniak.com/reverse-proxys-v3/ci-scripts/staging/schema.json"] =
                "vars.yaml",
                ["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = { ".gitlab-ci.yaml", ".gitlab-ci.yml" }
            },
        }
    }
}
